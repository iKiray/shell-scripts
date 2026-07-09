#!/usr/bin/env bash
set -euo pipefail

echo "=== Script Starting..."
echo ""

# Update Homebrew package definitions
brew update

# Upgrade installed formulae and casks
# --greedy also upgrades casks that don't auto-update.
# Temporarily disable pipefail so the "yes" command exiting
# doesn't cause the pipeline to be treated as a failure.
set +o pipefail
yes | brew upgrade --greedy
brew_status=${PIPESTATUS[1]}
set -o pipefail

# Exit if brew upgrade failed.
if [[ "$brew_status" -ne 0 ]]; then
    exit "$brew_status"
fi

# Remove old versions and cached downloads
brew cleanup

echo ""
echo "Script Finished. ==="

# ------------------------------------------------------------
# Script Flow Summary
#
# 1. Print a starting message.
# 2. Update Homebrew and refresh package metadata.
# 3. Temporarily disable pipefail so the "yes | brew upgrade"
#    pipeline isn't marked as failed when "yes" exits.
# 4. Upgrade all installed formulae and casks using
#    "brew upgrade --greedy", automatically answering any
#    confirmation prompts with "yes".
# 5. Save the exit status of the "brew upgrade" command.
# 6. Re-enable pipefail.
# 7. Exit the script if the brew upgrade failed.
# 8. Remove old package versions and cached downloads with
#    "brew cleanup".
# 9. Print a finished message.
# ------------------------------------------------------------
