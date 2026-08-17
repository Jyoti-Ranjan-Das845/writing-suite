#!/usr/bin/env bash
set -euo pipefail
source "$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)/common.sh"

failed=0; header
if validate_runtime_root "$SOURCE_ROOT"; then ok 'Source bundle'; else err 'Source bundle'; failed=1; fi
if [[ -d $MANAGED_CURRENT ]]; then
  if validate_runtime_root "$MANAGED_CURRENT" && verify_manifest "$MANAGED_CURRENT" "$MANIFEST_PATH"; then ok 'Managed installation'
  else err 'Managed installation'; failed=1; fi
else warn 'Managed installation: not installed'; fi
for client in claude codex; do
  status=$(link_status "$client")
  if client_detected "$client"; then info "$(client_label "$client"): $(client_version "$client")"; else info "$(client_label "$client"): binary not detected"; fi
  case $status in
    installed) [[ -d $MANAGED_CURRENT ]] && ok "$(client_label "$client"): linked to managed runtime" || { err "$(client_label "$client"): managed target missing"; failed=1; } ;;
    absent) info "$(client_label "$client"): not installed" ;;
    *) err "$(client_label "$client"): $(describe_status "$status")"; failed=1 ;;
  esac
done
((failed == 0))
