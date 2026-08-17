#!/usr/bin/env bash
set -euo pipefail
source "$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)/common.sh"

selected=(); ASSUME_YES=0
while (($#)); do case $1 in
  --claude) selected=(claude);; --codex) selected=(codex);; --all) selected=(claude codex);;
  --yes) ASSUME_YES=1;; --help|-h) print_help_uninstall; exit 0;; *) die "Unknown option: $1";;
esac; shift; done
installed=()
for client in claude codex; do
  if [[ $(link_status "$client") == installed ]]; then installed+=("$client"); fi
done
header
if ((${#installed[@]} == 0)); then info 'Writing Suite is not installed for any supported client.'; exit 0; fi
if ((${#selected[@]} == 0)); then
  if ((${#installed[@]} == 1)); then
    printf '1. Uninstall from %s\n2. Cancel\n' "$(client_label "${installed[0]}")"
    if [[ ! -t 0 ]]; then info 'Cancelled: no interactive input.'; exit 0; fi
    read -r -p 'Choose an option: ' choice
    [[ $choice == 1 ]] && selected=("${installed[0]}") || { info 'Cancelled.'; exit 0; }
  else
    printf '1. Uninstall from Claude Code\n2. Uninstall from Codex\n3. Uninstall from both\n4. Cancel\n'; read -r -p 'Choose an option: ' choice
    case $choice in 1) selected=(claude);; 2) selected=(codex);; 3) selected=(claude codex);; *) info 'Cancelled.'; exit 0;; esac
  fi
fi
failed=0; for client in "${selected[@]}"; do remove_managed_link "$client" || failed=1; done
if [[ $(managed_link_count) == 0 && -d $DATA_ROOT ]]; then
  if [[ $ASSUME_YES == 1 ]]; then info "Managed copy retained at $DATA_ROOT (safe noninteractive policy)."
  elif confirm "No supported clients remain linked. Remove managed Writing Suite copy at $DATA_ROOT?"; then rm -rf -- "$DATA_ROOT"; ok 'Removed managed Writing Suite copy.'
  else info "Managed copy retained at $DATA_ROOT."; fi
fi
((failed == 0)) || exit 1
