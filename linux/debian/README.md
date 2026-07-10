# Debian

Maintenance scripts for Debian-based systems (uses `apt`).

## Scripts

### `update-packages.example.sh`

Updates system packages and cleans up old caches.

- Refreshes package lists via `apt update`.
- Installs available upgrades via `apt upgrade -y`.
- Removes packages that are no longer needed via `apt autoremove -y`.
- Removes obsolete downloaded package files via `apt autoclean`.

**Requires:** `apt` and `sudo` privileges.

**Usage:**

```bash
./update-packages.example.sh
```
