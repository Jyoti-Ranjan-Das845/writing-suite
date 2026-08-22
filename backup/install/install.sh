#!/usr/bin/env bash
set -euo pipefail
source "$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)/common.sh"
trap cleanup_staging EXIT

selected=(); ASSUME_YES=0
while (($#)); do case $1 in
  --claude) selected=(claude) ;; --codex) selected=(codex) ;; --all) selected=(claude codex) ;;
  --yes) ASSUME_YES=1 ;; --help|-h) print_help_install; exit 0 ;; *) die "Unknown option: $1" ;;
esac; shift; done

available=()
for client in claude codex; do client_detected "$client" && available+=("$client"); done
header; info 'Detecting supported agents…'
for client in claude codex; do
  if client_detected "$client"; then ok "$(client_label "$client")  $(client_version "$client") — $(describe_status "$(link_status "$client")")"
  else warn "$(client_label "$client") — not detected"; fi
done
if ((${#available[@]} == 0)); then warn 'No supported agent installation was detected. Writing Suite supports Claude Code and Codex.'; exit 0; fi

if ((${#selected[@]} == 0)); then
  if [[ ! -t 0 ]]; then
    info 'Interactive selection is unavailable.'
    info 'No installation was performed.'
    info 'Use --claude, --codex, or --all for non-interactive installation.'
    exit 0
  fi
  if ((${#available[@]} == 1)); then
    printf '1. Install for %s\n2. Do not install / Cancel\n' "$(client_label "${available[0]}")"
    read -r -p 'Choose an option: ' choice
    [[ $choice == 1 ]] && selected=("${available[0]}") || { info 'Cancelled.'; exit 0; }
  else
    printf '1. Install for Claude Code\n2. Install for Codex\n3. Install for both\n4. Do not install / Cancel\n'
    read -r -p 'Choose an option: ' choice
    case $choice in 1) selected=(claude);; 2) selected=(codex);; 3) selected=(claude codex);; *) info 'Cancelled.'; exit 0;; esac
  fi
fi
for client in "${selected[@]}"; do client_detected "$client" || die "$(client_label "$client") is not detected; refusing to install."; done
actionable=0
for client in "${selected[@]}"; do
  case $(link_status "$client") in
    installed|absent) actionable=1 ;;
    *) warn "$(client_label "$client") skipped: $(describe_status "$(link_status "$client")") at $(client_target "$client")" ;;
  esac
done
((actionable == 1)) || die 'No selected client can be installed without replacing an existing target.'
install_managed_copy
ok "Managed Writing Suite installed: $MANAGED_CURRENT"
failed=0
for client in "${selected[@]}"; do link_client "$client" || failed=1; done
((failed == 0)) || exit 1
