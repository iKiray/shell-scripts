#!/usr/bin/env bash
set -euo pipefail

# standard starting lines

echo "=== Script Starting..."
echo ""

# update pacman/aur packages & flatpaks
paru -Syu --noconfirm
flatpak update -y

# clean package caches
# paccache keeps the latest 3 versions by default
# flatpak removes unused runtimes and dependencies
paccache -r
flatpak uninstall --unused -y

echo ""
echo "Script Finished. ==="
