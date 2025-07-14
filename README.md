# 🚀 Essential Packages Installer

A one-stop script to install essential packages on **Ubuntu/Debian-based** systems. Perfect for quick setup after a fresh OS install!

---

## 🛠️ **Installation**

### **Method 1: Clone & Run (Recommended)**
Run this single command to **clone the repo and start installation**:
```bash
git clone https://github.com/geekpnx/install-essentials.git && cd install-essentials && chmod +x install.sh && ./install.sh
```
### **Method 2: Direct Execute (No Git clone)**
```bash
bash <(curl -s https://raw.githubusercontent.com/geekpnx/install-essentials/main/install.sh)
```

### 🔧 **System Utilities**
| Package | Description |
|---------|-------------|
| `font-manager` | GUI for installing and managing fonts |
| `tasksel` | Tool for selecting and installing software bundles |
| `openssh-server` | Secure Shell server for remote access |
| `nano` | Simple command-line text editor |
| `ufw` | Uncomplicated Firewall configuration tool |
| `cups` | Common UNIX Printing System |
| `wget` | Command-line utility for downloading files |
| `git` | Distributed version control system |
| `htop` | Interactive process viewer (enhanced top) |
| `nmap` | Network exploration and security auditing tool |

### 🎨 **Graphics & Media**
| Package | Description |
|---------|-------------|
| `gimp` | Full-featured image manipulation program |
| `inkscape` | Professional vector graphics editor |
| `darktable` | RAW photo developer and digital darkroom |
| `shotwell` | Photo organizer and image viewer |
| `smplayer` | Multimedia player with multiple codecs |
| `vlc` | Cross-platform media player and streaming server |
| `rhythmbox` | Music player and organizer |
| `audacity` | Multi-track audio editor and recorder |
| `clementine` | Modern music player with library features |

### 💼 **Productivity**
| Package | Description |
|---------|-------------|
| `mousepad` | Simple graphical text editor |
| `libreoffice` | Complete office productivity suite |
| `evince` | Document viewer for multiple formats |
| `atril` | MATE desktop's document viewer |
| `xournalpp` | Handwritten notes and PDF annotation |
| `pdfarranger` | PDF file merging, splitting and rearranging |
| `micro` | Modern and intuitive terminal text editor |

### 🌐 **Internet & Networking**
| Package | Description |
|---------|-------------|
| `chromium` | Open-source web browser project |
| `firefox-esr` | Extended Support Release web browser |
| `qbittorrent` | Efficient and feature-rich torrent client |
| `filezilla` | Full-featured FTP/SFTP client |
| `remmina` | Remote desktop client with multiple protocols |
| `tigervnc-standalone-server` | High-performance VNC server |
| `tigervnc-common` | Common files for TigerVNC |

### 🎮 **Games & Fun**
| Package | Description |
|---------|-------------|
| `gnome-mahjongg` | Classic mahjongg solitaire game |
| `gnome-chess` | 3D chess game with multiple difficulty levels |
| `cmatrix` | Matrix-style terminal screensaver |
| `sl` | Steam locomotive animation in terminal |
| `tty-clock` | Digital clock display in terminal |
| `neofetch` | System information display with ASCII art |
| `cbonsai` | Animated bonsai tree in terminal |
| `nsnake` | Classic snake game in terminal |
| `bb` | ASCII art demo with music support |
| `oneko` | Cursor that turns into a chasing cat |
| `lolcat` | Rainbow color output for terminal |
| `toilet` | ASCII text display with various fonts |

### 🛠️ **Utilities**
| Package | Description |
|---------|-------------|
| `pcmanfm` | Lightweight file manager with tab support |
| `deepin-calculator` | Scientific calculator with history |
| `deepin-screen-recorder` | Feature-rich screen recording tool |
| `tilix` | Advanced tiling terminal emulator |

## ❓ **FAQ**

### **Is this safe to run?**
✅ **Yes!** The script only uses standard `apt` packages. Always review the [source code](install.sh) before running.

### **How can I customize the installation?**
1. Clone the repository
2. Edit the `install.sh` file
3. Add/remove packages as needed

### **What systems are supported?**
- Ubuntu 20.04 LTS and newer
- Debian 11 (Bullseye) and newer
- Other Debian-based distributions may work

## ⚠️ **Requirements**

- **Debian-based** Linux distribution
- **Internet connection** (for package downloads)
- **sudo/root privileges** (for installation)
- Minimum **2GB RAM** recommended
- At least **10GB disk space** available