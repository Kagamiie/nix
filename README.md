# 🚀 Personal NixOS Configuration

> A minimal NixOS setup with i3wm - includes security configs (still learning)

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-25.05-5277C3.svg?style=for-the-badge&logo=nixos&logoColor=white)
![i3wm](https://img.shields.io/badge/i3wm-Window%20Manager-4C7899.svg?style=for-the-badge)
![Home Manager](https://img.shields.io/badge/Home%20Manager-Enabled-FF6B6B.svg?style=for-the-badge)
![Flakes](https://img.shields.io/badge/Nix%20Flakes-Experimental-4ECDC4.svg?style=for-the-badge)

</div>

## 📁 Project Structure

```
.
├── flake.nix                 # Main flake configuration
├── nixos/
│   ├── configuration.nix     # System configuration
│   └── hardware-configuration.nix
├── home-manager/
│   └── home.nix             # User environment configuration
└── modules/
    ├── packages.nix         # System packages
    ├── desktop.nix         # System services
    ├── services.nix         # System services
    └── users.nix            # User management
```

## 🚀 Quick Start

### Prerequisites
- NixOS installed on your system
- Flakes enabled in your Nix configuration

### Installation

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd nix
   ```

2. **Update the configuration**
   ```bash
   # Edit flake.nix to match your hostname
   nano flake.nix
   
   # Update git configuration in home-manager/home.nix
   nano home-manager/home.nix
   ```

3. **Apply system configuration**
   ```bash
   sudo nixos-rebuild switch --flake .#hostname
   ```

4. **Apply home-manager configuration**
   ```bash
   nix run nixpkgs#home-manager -- --flake . switch
   ```

## ⚡ Convenient Aliases

Once installed, you'll have these handy aliases available:

| Alias | Command | Description |
|-------|---------|-------------|
| `sys-up` | `sudo nixos-rebuild switch --flake ~/ur/path/.#hostname` | Update system configuration |
| `home-up` | `home-manager --flake ~/ur/path/. switch` | Update home-manager configuration |
| `flakec` | `nano ~/ur/path/flake.nix` | Edit flake configuration |
| `homec` | `nano ~/ur/path/home-manager/home.nix` | Edit home configuration |
| `sysc` | `nano ~/ur/path/nixos/configuration.nix` | Edit system configuration |

## 📋 System Information

- **NixOS Version**: 25.05
- **Home Manager**: release-25.05
- **Default Shell**: Zsh with Oh-My-Zsh
- **Terminal**: Alacritty
- **File Manager**: Ranger
- **Theme**: af-magic (Oh-My-Zsh)

### ✨ Features

### 🖥️ **Desktop Environment**
- **i3 Window Manager**
- **LightDM with Mini Greeter**
- **Polybar**
- **Rofi**
- **Picom**

### 🌐 **Applications**
- **Zen Browser**
- **Obsidian**
- **Stremio**
- **Flameshot**
- **nmap** 
- **sqlmap**
- **gobuster**
- **Wireshark**

### 🛠️ **Development Tools**
- **C/C++ Development** - GCC, CMake, Make
- **ARM Embedded** - gcc-arm-embedded for embedded development
- **LaTeX** (texlive-full) with Pandoc

## 📝 Notes

- The configuration assumes the username `ks` - update accordingly
- Auto-login is enabled for convenience (disable in `modules/users.nix` if not desired)
- SSH is configured with key-based authentication only
- The system uses the Europe/Paris timezone with French locale settings
