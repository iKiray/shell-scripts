# Common

Cross-platform utility scripts that aren't tied to a specific OS or distro.

## Scripts

### `run-all.example.sh`

Runs every other `.sh` script in this directory sequentially, printing a success/failure status for each one.

- Skips itself to avoid infinite recursion.
- Continues through all scripts even if one fails (uses `set -uo pipefail`, not `-e`), so a single broken script won't stop the rest from running.
- Prints `✓ Success` or `✗ Failed` based on each script's exit code.

**Usage:**

```bash
./run-all.example.sh
```
