#!/bin/bash

# Installation script for essential packages
# Usage: ./install.sh

# Exit immediately if a command exits with non-zero status
set -e

# Update package lists
echo "Updating package lists..."
sudo apt update

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Install essential packages
echo "Installing essential packages..."
sudo apt install -y \
    font-manager \
    tasksel \
    openssh-server \
    nano \
    ufw \
    deepin-screen-recorder \
    smplayer \
    tilix \
    clementine \
    mousepad \
    gimp \
    inkscape \
    darktable \
    audacity \
    cups \
    atril \
    remmina \
    wget \
    git \
    curl \
    pcmanfm \
    rhythmbox \
    evince \
    micro \
    vlc \
    qbittorrent \
    filezilla \
    shotwell \
    chromium \
    firefox-esr 

# Clean up
echo "Cleaning up..."
sudo apt autoremove -y

echo "Installation complete!"
