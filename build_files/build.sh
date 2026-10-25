#!/bin/bash
set -ouex pipefail

# Install utilities
dnf5 -y install \
  cliphist \
  grim \
  kitty \
  swaybg \
  swaync \
  thunar \
  thunar-volman \
  tumbler \
  waybar \
  wofi

# Install Hyprland
dnf5 -y copr enable sdegler/hyprland
dnf5 -y swap terra-xorg-x11-server-Xwayland xorg-x11-server-Xwayland
dnf5 -y install \
  hyprland \
  hyprland-guiutils \
  hypridle \
  hyprlauncher \
  hyprlock \
  hyprpaper \
  hyprpicker \
  hyprpolkitagent \
  hyprsunset \
  xdg-desktop-portal-hyprland
dnf5 -y copr disable sdegler/hyprland

# Copy system files
cp -af /ctx/system_files/. /

# Clean up
dnf5 clean all
rm -rf /run/dnf /var/lib/dnf
