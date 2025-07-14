#!/bin/bash

# Installation script for essential packages
# Usage: ./install.sh

# Exit immediately if a command exits with non-zero status
set -e

# Colors and formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
NC='\033[0m' # No Color

# Progress indicator
spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Function to print section headers
section() {
    echo -e "\n${MAGENTA}${BOLD}===== $1 =====${NC}\n"
}

# Function to print status messages
status() {
    echo -e "${YELLOW}${BOLD}[~]${NC} ${YELLOW}$1${NC}"
}

# Function to print success messages
success() {
    echo -e "${GREEN}${BOLD}[✓]${NC} ${GREEN}$1${NC}"
}

# Function to print info messages
info() {
    echo -e "${BLUE}${BOLD}[i]${NC} ${BLUE}$1${NC}"
}

# Print welcome message
echo -e "${CYAN}${BOLD}"
echo "  ____           _        _ _   ____            _       _   "
echo " |  _ \ ___  ___| |_     | | | / ___|  ___ __ _| |_ ___| |_ "
echo " | |_) / _ \/ __| __|____| | | \___ \ / __/ _\` | __/ __| __|"
echo " |  __/ (_) \__ \ ||_____|_|_| |____) | (_| (_| | || (__| |_ "
echo " |_|   \___/|___/\__|    (_|_) |____/ \___\__,_|\__\___|\__|"
echo -e "${NC}"
echo -e "${BOLD}Essential Packages Installation Script${NC}"
echo -e "${UNDERLINE}This script will update, upgrade, and install essential packages${NC}\n"

# Update package lists
section "System Update"
status "Updating package lists..."
sudo apt update -qq & spinner
success "Package lists updated successfully!"

# Upgrade installed packages
section "System Upgrade"
status "Upgrading installed packages (this may take a while)..."
sudo apt upgrade -y -qq & spinner
success "System upgraded successfully!"

# Install essential packages
section "Package Installation"
info "The following packages will be installed:"
echo -e "${CYAN}"
echo "  - System Tools: font-manager, tasksel, ufw, tilix, pcmanfm"
echo "  - Network: openssh-server, wget, git, curl, remmina, filezilla"
echo "  - Media: smplayer, clementine, rhythmbox, vlc, qbittorrent"
echo "  - Graphics: gimp, inkscape, darktable, shotwell"
echo "  - Office: libreoffice, evince, atril"
echo "  - Utilities: nano, micro, mousepad, cups, btop"
echo -e "${NC}"

status "Installing essential packages (this will take some time)..."
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
    firefox-esr \
    libreoffice \
    htop \
    gnome-mahjongg \
    gnome-chess \
    deepin-calculator \
    nmap \
    xournalpp \
    pdfarranger \
    tigervnc-standalone-server \
    tigervnc-common \
    cmatrix \
    sl \
    tty-clock \
    neofetch \
    cbonsai \
    nsnake \
    bb \
    oneko \
    lolcat \
    toilet \ & spinner
success "All packages installed successfully!"

# Clean up
section "System Cleanup"
status "Removing unnecessary packages..."
sudo apt autoremove -y -qq & spinner
success "System cleanup completed!"

# Completion message
echo -e "\n${GREEN}${BOLD}"
echo "  ____                      _      _         _   "
echo " / ___| _ __ ___   ___   ___| |_   / \  _   _| |_ "
echo " \___ \| '_ \` _ \ / _ \ / __| __| / _ \| | | | __|"
echo "  ___) | | | | | | (_) | (__| |_ / ___ \ |_| | |_ "
echo " |____/|_| |_| |_|\___/ \___|\__/_/   \_\__,_|\__|"
echo -e "${NC}"
echo -e "${BOLD}Installation complete!${NC}"
echo -e "${YELLOW}Please reboot your system for all changes to take effect.${NC}"