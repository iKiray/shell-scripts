# Arch Linux

Maintenance scripts for Arch-based systems (uses `pacman`/`paru`, `flatpak`, and `docker`).

## Scripts

### `update-packages.example.sh`

Updates system packages and cleans up old caches.

- Updates pacman/AUR packages via `paru -Syu --noconfirm`.
- Updates Flatpak packages via `flatpak update -y`.
- Trims the package cache with `paccache -r` (keeps the latest 3 versions by default).
- Removes unused Flatpak runtimes/dependencies with `flatpak uninstall --unused -y`.

**Requires:** `paru` (AUR helper) and `flatpak` installed.

### `update-docker-composes.example.sh`

Finds and rebuilds every Docker Compose project under `~/docker`, then prunes unused Docker resources.

- Searches `~/docker` for `docker-compose.yaml` files, skipping any `db_data` directories to avoid touching database volumes.
- For each compose file found, runs `build`, `pull`, and `up -d` in order.
- Runs `docker system prune -af` afterward to remove unused containers, networks, images, and build cache.

**Requires:** Docker with the Compose plugin, and compose projects laid out under `~/docker`.

**Usage:**

```bash
./update-packages.example.sh
./update-docker-composes.example.sh
```
