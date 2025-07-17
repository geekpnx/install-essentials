#!/bin/bash

# --------------------------------------------------------------------------
# Linux Apps Installer v1.1
# Improved with package verification, error handling, and missing package detection
# Usage: ./install.sh
# --------------------------------------------------------------------------

# Exit on errors, but allow continuation for package failures
set -eo pipefail

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

# Track failed packages
FAILED_PKGS=()

# Function to print section headers
section() {
    echo -e "\n${MAGENTA}${BOLD}===== $1 =====${NC}"
}

# Status messages
status() { echo -e "${YELLOW}${BOLD}[~]${NC} ${YELLOW}$1${NC}"; }
success() { echo -e "${GREEN}${BOLD}[✓]${NC} ${GREEN}$1${NC}"; }
error() { echo -e "${RED}${BOLD}[X]${NC} ${RED}$1${NC}"; }
info() { echo -e "${BLUE}${BOLD}[i]${NC} ${BLUE}$1${NC}"; }

# Check if a package exists in repositories
pkg_exists() {
    apt-cache show "$1" &>/dev/null
}

# Install a package with error handling
install_pkg() {
    local pkg="$1"
    if pkg_exists "$pkg"; then
        status "Installing $pkg..."
        if sudo apt install -y "$pkg" > /dev/null; then
            success "$pkg installed successfully!"
            return 0
        else
            error "Failed to install $pkg (apt error)"
            FAILED_PKGS+=("$pkg")
            return 1
        fi
    else
        error "Package not found: $pkg"
        FAILED_PKGS+=("$pkg")
        return 1
    fi
}

# Print header
echo -e "${CYAN}${BOLD}"
echo "   ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗     █████╗ ██████╗ ██████╗ ███████╗"
echo "   ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝    ██╔══██╗██╔══██╗██╔══██╗██╔════╝"
echo "   ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝     ███████║██████╔╝██████╔╝███████╗"
echo "   ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗     ██╔══██║██╔═══╝ ██╔═══╝ ╚════██║"
echo "   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗    ██║  ██║██║     ██║     ███████║"
echo "   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝"
echo "   -------------------------------------------------------------------------"
echo "                     Linux Apps Installer v1.1 (Improved)                    "
echo -e "${NC}"
echo -e "${BOLD}Essential Packages Installation Script${NC}"
echo -e "${UNDERLINE}Now with missing package detection and better error handling${NC}\n"

# Update package lists
section "System Update"
status "Updating package lists..."
sudo apt update -qq
success "Package lists updated!"

# Upgrade installed packages
section "System Upgrade"
status "Upgrading installed packages..."
sudo apt upgrade -y -qq
success "System upgraded!"

# Package installation
section "Package Installation"
info "The following packages will be installed:"
echo -e "${CYAN}"
echo "  - System Tools: font-manager, ufw, tilix, pcmanfm"
echo "  - Network: openssh-server, wget, git, curl, remmina, filezilla"
echo "  - Media: smplayer, clementine, rhythmbox, vlc, qbittorrent"
echo "  - Graphics: gimp, inkscape, darktable, shotwell"
echo "  - Office: libreoffice, evince, atril"
echo "  - Utilities: nano, micro, mousepad, cups, btop"
echo -e "${NC}"

# List of packages to install
PKGS=(
    # System Tools
    font-manager ufw tilix pcmanfm
    # Network
    openssh-server wget git curl remmina filezilla nmap tigervnc-standalone-server tigervnc-common
    # Browser
    chromium firefox-esr
    # Media
    smplayer clementine rhythmbox vlc qbittorrent audacity
    # Graphics
    gimp inkscape darktable shotwell
    # Office
    libreoffice evince atril xournalpp pdfarranger
    # Utilities
    nano micro mousepad cups btop htop
    # Optional/Game
    cmatrix sl neofetch lolcat toilet gnome-mahjongg gnome-chess nsnake cbonsai tty-clock oneko
    # Deepin (may fail if repo not added)
    deepin-screen-recorder deepin-calculator
)

# Install packages one by one
for pkg in "${PKGS[@]}"; do
    install_pkg "$pkg" || continue
done

# Post-install summary
section "Installation Summary"
if [ ${#FAILED_PKGS[@]} -eq 0 ]; then
    success "All packages installed successfully!"
else
    error "The following packages failed to install:"
    for failed in "${FAILED_PKGS[@]}"; do
        echo -e "  - ${RED}$failed${NC}"
    done
    echo -e "\n${YELLOW}Note: Some packages may require additional repositories (e.g., Deepin).${NC}"
fi

# Clean up
section "System Cleanup"
status "Removing unnecessary packages..."
sudo apt autoremove -y -qq
success "Cleanup completed!"

# Final message
echo -e "\n${GREEN}${BOLD}"
echo "   ███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗███████╗"
echo "   ██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝"
echo "   ███████╗██║   ██║██║     ██║     █████╗  ███████╗███████╗"
echo "   ╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║╚════██║"
echo "   ███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║███████║"
echo "   ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝"
echo -e "${NC}"
echo -e "${BOLD}Script execution complete!${NC}"
if [ ${#FAILED_PKGS[@]} -gt 0 ]; then
    echo -e "${YELLOW}Some packages failed to install. Check above for details.${NC}"
fi
echo -e "${YELLOW}Consider rebooting your system for all changes to take effect.${NC}"