#!/usr/bin/env bash

set -euo pipefail

DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

echo " Running install scripts"
[[ "$DRY_RUN" == true ]] && echo "󱑒 Dry run mode enabled"

"$PWD/install/packages.sh" $([[ "$DRY_RUN" == true ]] && echo "--dry-run")

echo ""
"$PWD/install/link.sh" $([[ "$DRY_RUN" == true ]] && echo "--dry-run")

echo ""
echo " All done."

