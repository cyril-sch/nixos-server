#!/usr/bin/env bash
set -euo pipefail

HOST=${1:?"Usage: $0 <hostname>"}
REPO=${2:-"https://github.com/cyril-sch/nixos-server-template"}

echo "==> Bootstrap NixOS pour l'hôte : $HOST"

# 1. Cloner le template
nix-shell -p git --run "git clone $REPO /tmp/nixos-config"
cd /tmp/nixos-config

# 2. Partitionner avec disko
echo "==> Partitionnement via disko..."
nix run github:nix-community/disko -- \
  --mode disko \
  ./hosts/$HOST/disk.nix

# 3. Générer hardware-configuration.nix
echo "==> Génération du hardware-configuration.nix..."
nixos-generate-config --no-filesystems --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/$HOST/

# 4. Installer
echo "==> Installation NixOS..."
nixos-install --flake .#$HOST --no-root-passwd

echo ""
echo "==> Terminé. Définir un mot de passe root :"
echo "    nixos-enter --root /mnt -- passwd admin"
echo "==> Puis : reboot"