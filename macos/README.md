# macOS

Maintenance scripts for macOS systems.

## Scripts

### `update-homebrew.example.sh`

Updates Homebrew, upgrades all installed formulae and casks, and cleans up old versions.

- Runs `brew update` to refresh package definitions.
- Runs `brew upgrade --greedy` (auto-confirmed via `yes`) so casks that don't normally auto-update get upgraded too.
- Temporarily disables `pipefail` around the `yes | brew upgrade` pipeline so `yes` exiting (once `brew upgrade` finishes and closes the pipe) isn't mistaken for a failure; the real exit code is captured from `PIPESTATUS[1]` and checked afterward.
- Runs `brew cleanup` to remove old formula versions and cached downloads.

**Requires:** Homebrew installed.

**Usage:**

```bash
./update-homebrew.example.sh
```
