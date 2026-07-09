#!/usr/bin/env bash
set -uo pipefail

echo "=== Running All Scripts ==="
echo

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

for script in "$SCRIPT_DIR"/*.sh; do
    [[ "$script" == "$SCRIPT_DIR/run-all.sh" ]] && continue

    echo ">>> Running $(basename "$script")"

    if bash "$script"; then
        echo "✓ Success"
    else
        echo "✗ Failed"
    fi

    echo
done

echo "=== All Scripts Finished. ==="

# ------------------------------------------------------------
# Script Flow Summary
#
# 1. Print a starting message.
# 2. Determine the directory this script is located in.
# 3. Find every .sh file in that directory.
# 4. Loop through each script.
# 5. Skip this script (run-all.sh) to avoid infinite recursion.
# 6. Run each remaining script using Bash.
# 7. Check the exit status:
#      - Exit code 0   -> print "✓ Success"
#      - Non-zero code -> print "✗ Failed"
# 8. Continue until all scripts have been processed.
# 9. Print a finished message.
# ------------------------------------------------------------
