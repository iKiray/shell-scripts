#!/usr/bin/env bash
set -euo pipefail

# standard start

echo "=== Script Starting..."
echo ""

# update the package lists
sudo apt update

# install available package upgrades
sudo apt upgrade -y

# remove packages that are no longer needed
sudo apt autoremove -y

# remove obsolete downloaded package files
sudo apt autoclean

echo ""
echo "Script Finished. ==="
