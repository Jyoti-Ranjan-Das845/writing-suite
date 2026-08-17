#!/usr/bin/env bash
# Shared helpers for the Writing Suite distribution scripts.

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
SOURCE_ROOT=${WRITING_SUITE_SOURCE_ROOT:-$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd -P)}
DATA_ROOT=${WRITING_SUITE_DATA_ROOT:-"${XDG_DATA_HOME:-$HOME/.local/share}/writing-suite"}
MANAGED_CURRENT="$DATA_ROOT/current"
MANIFEST_PATH="$DATA_ROOT/manifest.sha256"
INSTALL_INFO_PATH="$DATA_ROOT/install-info"
CLAUDE_SKILLS_ROOT=${WRITING_SUITE_CLAUDE_SKILLS_ROOT:-"${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"}
CODEX_SKILLS_ROOT=${WRITING_SUITE_CODEX_SKILLS_ROOT:-"$HOME/.agents/skills"}
WRITING_SUITE_STAGING=${WRITING_SUITE_STAGING:-}

COLOR_RESET=''; COLOR_OK=''; COLOR_INFO=''; COLOR_WARN=''; COLOR_ERROR=''; BOLD=''
if [[ -t 1 && -z ${NO_COLOR:-} ]]; then
  COLOR_RESET=$'\033[0m'; COLOR_OK=$'\033[32m'; COLOR_INFO=$'\033[36m'
  COLOR_WARN=$'\033[33m'; COLOR_ERROR=$'\033[31m'; BOLD=$'\033[1m'
fi

say() { printf '%b\n' "$*"; }
info() { say "${COLOR_INFO}•${COLOR_RESET} $*"; }
ok() { say "${COLOR_OK}✓${COLOR_RESET} $*"; }
warn() { say "${COLOR_WARN}!${COLOR_RESET} $*"; }
err() { say "${COLOR_ERROR}✗${COLOR_RESET} $*" >&2; }
header() { say "${BOLD}${COLOR_INFO}Writing Suite Installer${COLOR_RESET}"; }

die() { err "$*"; exit 1; }
cleanup_staging() {
  if [[ -n ${WRITING_SUITE_STAGING:-} && -d ${WRITING_SUITE_STAGING:-} ]]; then rm -rf -- "$WRITING_SUITE_STAGING"; fi
  return 0
}

client_label() { [[ $1 == claude ]] && printf 'Claude Code' || printf 'Codex'; }
client_target() {
  case $1 in
    claude) printf '%s/writing-suite\n' "$CLAUDE_SKILLS_ROOT" ;;
    codex) printf '%s/writing-suite\n' "$CODEX_SKILLS_ROOT" ;;
    *) return 1 ;;
  esac
}
client_binary() {
  case $1 in
    claude) printf '%s\n' "${WRITING_SUITE_CLAUDE_BIN:-claude}" ;;
    codex) printf '%s\n' "${WRITING_SUITE_CODEX_BIN:-codex}" ;;
    *) return 1 ;;
  esac
}
client_detected() { command -v "$(client_binary "$1")" >/dev/null 2>&1; }
client_version() {
  local bin output
  bin=$(client_binary "$1")
  output=$("$bin" --version 2>/dev/null | head -n 1 || true)
  [[ -n $output ]] && printf '%s\n' "$output" || printf 'unknown\n'
}

checksum_command() {
  if command -v sha256sum >/dev/null 2>&1; then printf 'sha256sum\n'
  elif command -v shasum >/dev/null 2>&1; then printf 'shasum\n'
  else return 1; fi
}
sha256_file() {
  local tool
  tool=$(checksum_command) || die 'No supported SHA-256 utility found (need sha256sum or shasum).'
  if [[ $tool == sha256sum ]]; then sha256sum "$1" | awk '{print $1}'
  else shasum -a 256 "$1" | awk '{print $1}'; fi
}

validate_runtime_root() {
  local root=$1 required
  for required in SKILL.md standards-registry.md skills standards templates \
    skills/writing-requirements/SKILL.md skills/content-grounding/SKILL.md \
    skills/authoring-contract/SKILL.md skills/writer/SKILL.md skills/reviewer/SKILL.md \
    templates/registry.md templates/artifact/requirements.md templates/artifact/grounding.md \
    templates/artifact/authority.md templates/artifact/review.md; do
    [[ -e "$root/$required" ]] || { err "Missing required runtime path: $required"; return 1; }
  done
  grep -Eq '^name:[[:space:]]*writing-suite[[:space:]]*$' "$root/SKILL.md" || {
    err 'SKILL.md does not declare name: writing-suite'; return 1;
  }
  head -n 1 "$root/SKILL.md" | grep -qx -- '---' || {
    err 'SKILL.md is missing YAML frontmatter'; return 1;
  }
  awk 'NR > 1 && /^---[[:space:]]*$/ { found=1; exit } END { exit !found }' "$root/SKILL.md" || {
    err 'SKILL.md has unclosed YAML frontmatter'; return 1;
  }
}

build_manifest() {
  local runtime=$1 manifest=$2 file rel
  : > "$manifest"
  while IFS= read -r file; do
    rel=${file#"$runtime/"}
    printf '%s  %s\n' "$(sha256_file "$file")" "$rel" >> "$manifest"
  done < <(find "$runtime" -type f ! -name '.DS_Store' -print | LC_ALL=C sort)
}

verify_manifest() {
  local runtime=$1 manifest=$2 hash rel actual failed=0
  [[ -f $manifest ]] || { err "Missing manifest: $manifest"; return 1; }
  while read -r hash rel; do
    [[ -n ${hash:-} && -n ${rel:-} && -f "$runtime/$rel" ]] || { err "Manifest path missing: ${rel:-unknown}"; failed=1; continue; }
    actual=$(sha256_file "$runtime/$rel")
    [[ $actual == "$hash" ]] || { err "Checksum mismatch: $rel"; failed=1; }
  done < "$manifest"
  return "$failed"
}

link_status() {
  local target destination target_dir resolved managed_resolved
  target=$(client_target "$1")
  if [[ -L $target ]]; then
    destination=$(readlink "$target")
    if [[ $destination == /* ]]; then resolved=$destination
    else
      target_dir=$(CDPATH= cd -- "$(dirname -- "$target")" && pwd -P)
      resolved=$target_dir/$destination
    fi
    if [[ -e $resolved ]]; then
      resolved=$(CDPATH= cd -- "$resolved" && pwd -P)
      managed_resolved=$(CDPATH= cd -- "$MANAGED_CURRENT" 2>/dev/null && pwd -P || true)
      [[ -n $managed_resolved && $resolved == "$managed_resolved" ]] && { printf 'installed\n'; return; }
      printf 'other-symlink\n'
    else
      printf 'broken\n'
    fi
  elif [[ -e $target ]]; then printf 'conflict\n'
  else printf 'absent\n'; fi
}

describe_status() {
  case $1 in
    installed) printf 'Installed correctly' ;; absent) printf 'Not installed' ;;
    broken) printf 'Broken symlink' ;; other-symlink) printf 'Symlink to another location' ;;
    conflict) printf 'Existing real file/directory conflict' ;;
  esac
}

confirm() {
  local prompt=$1 answer
  [[ ${ASSUME_YES:-0} == 1 ]] && return 0
  [[ -t 0 ]] || return 1
  read -r -p "$prompt [y/N] " answer
  [[ $answer =~ ^[Yy]([Ee][Ss])?$ ]]
}

copy_runtime_to_staging() {
  local staging=$1 item
  mkdir -p "$staging"
  for item in SKILL.md standards-registry.md skills standards templates; do
    [[ -e "$SOURCE_ROOT/$item" ]] || die "Source runtime item is missing: $item"
    cp -R "$SOURCE_ROOT/$item" "$staging/"
  done
  find "$staging" -name '.DS_Store' -type f -delete
}

install_managed_copy() {
  local staging backup timestamp source_rev
  validate_runtime_root "$SOURCE_ROOT" || die 'Source Writing Suite validation failed.'
  mkdir -p "$DATA_ROOT"
  staging=$(mktemp -d "$DATA_ROOT/.staging.XXXXXX")
  WRITING_SUITE_STAGING=$staging
  copy_runtime_to_staging "$staging/current"
  validate_runtime_root "$staging/current" || die 'Staged Writing Suite validation failed.'
  build_manifest "$staging/current" "$staging/manifest.sha256"
  timestamp=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
  source_rev=$(git -C "$SOURCE_ROOT" rev-parse HEAD 2>/dev/null || printf 'unavailable')
  printf 'installed_at=%s\nsource_path=%s\nsource_commit=%s\n' "$timestamp" "$SOURCE_ROOT" "$source_rev" > "$staging/install-info"
  backup="$DATA_ROOT/.previous.$$.${RANDOM}"
  [[ -e $MANAGED_CURRENT || -L $MANAGED_CURRENT ]] && mv "$MANAGED_CURRENT" "$backup"
  if mv "$staging/current" "$MANAGED_CURRENT" && mv "$staging/manifest.sha256" "$MANIFEST_PATH" && mv "$staging/install-info" "$INSTALL_INFO_PATH"; then
    rm -rf -- "$backup" "$staging"
    WRITING_SUITE_STAGING=''
  else
    rm -rf -- "$MANAGED_CURRENT"
    [[ -e $backup || -L $backup ]] && mv "$backup" "$MANAGED_CURRENT"
    die 'Could not activate the managed Writing Suite copy.'
  fi
}

link_client() {
  local client=$1 target parent status
  target=$(client_target "$client"); parent=$(dirname -- "$target"); status=$(link_status "$client")
  case $status in
    installed) ok "$(client_label "$client"): already installed"; return 0 ;;
    absent) mkdir -p "$parent"; ln -s "$MANAGED_CURRENT" "$target"; ok "$(client_label "$client") linked: $target" ;;
    *) warn "$(client_label "$client") skipped: $(describe_status "$status") at $target"; return 1 ;;
  esac
}

remove_managed_link() {
  local client=$1 target status
  target=$(client_target "$client"); status=$(link_status "$client")
  if [[ $status == installed ]]; then rm -- "$target"; ok "Removed $(client_label "$client") link"; return 0; fi
  warn "$(client_label "$client") not removed: $(describe_status "$status")"; return 1
}

managed_link_count() {
  local n=0 client
  for client in claude codex; do
    if [[ $(link_status "$client") == installed ]]; then ((n+=1)); fi
  done
  printf '%s\n' "$n"
}

print_help_install() {
  cat <<'EOF'
Usage: install.sh [--claude | --codex | --all] [--yes] [--help]
Install the managed Writing Suite copy for detected Claude Code and/or Codex clients.
EOF
}

print_help_uninstall() {
  cat <<'EOF'
Usage: uninstall.sh [--claude | --codex | --all] [--yes] [--help]
Remove only Writing Suite symlinks created by this installer.
EOF
}
