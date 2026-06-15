# 🚀 Personal NixOS Configuration

> A minimal NixOS setup with Niri (Wayland compositor) - includes security hardening, theming, and dev tools (still learning)

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-25.11-5277C3.svg?style=for-the-badge&logo=nixos&logoColor=white)
![Niri](https://img.shields.io/badge/Niri-Wayland-4C7899.svg?style=for-the-badge)
![Home Manager](https://img.shields.io/badge/Home%20Manager-Enabled-FF6B6B.svg?style=for-the-badge)
![Stylix](https://img.shields.io/badge/Stylix-Theming-A78BFA.svg?style=for-the-badge)
![Flakes](https://img.shields.io/badge/Nix%20Flakes-Enabled-4ECDC4.svg?style=for-the-badge)

</div>

> [!NOTE]
> - User: `ks` | Host: `moya`
> - Compositor: Niri (Wayland)
> - Shell: Fish | Terminal: Foot
> - Editor: Zed

## Features

- 🖥️ Niri Wayland compositor
- 🎨 System-wide theming with Stylix
- 🛡️ SSH hardening + fail2ban + firewall + AppArmor
- 🎮 Gaming (Steam + GamesScope + GameMode + Wine + MangoHud)
- 🔧 Development tools + pentesting suite (nmap, sqlmap, gobuster, wireshark)
- 🐍 Python (numpy, matplotlib, scipy, JupyterLab) + LaTeX
- 🗄️ Virtualization + SQL
- 📦 Automated backups with 7z
- ⚡ TLP power management

> [!CAUTION]
> This is my personal NixOS config. Hardware-specific settings in `hardware-configuration.nix` and user configs may not work on your system. Always review and adapt before use.

## Flake Inputs

| Input | Description |
|-------|-------------|
| `nixpkgs` | NixOS 25.11 |
| `home-manager` | Home Manager release-25.11 |
| `stylix` | System-wide theming (release-25.11) |
| `niri` | Niri Wayland compositor flake |
| `quickshell` | Qt-based shell component |
| `zen-browser` | Zen browser |
| `dms` | DankMaterialShell |
| `millennium` | Steam client homebrew (Millennium) |

## Structure

```
.
├── flake.nix
├── flake.lock
├── home
│   └── ks
│       ├── default.nix
│       ├── home.nix
│       ├── programs
│       │   ├── foot
│       │   │   └── default.nix
│       │   ├── git
│       │   │   └── default.nix
│       │   └── shell
│       │       └── default.nix     # Fish shell + aliases
│       ├── system
│       │   └── gammastep
│       │       └── default.nix
│       └── archives
│           ├── sway
│           │   └── default.nix
│           └── wofi
│               └── default.nix
├── hosts
│   ├── moya
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── shared
│       ├── default.nix
│       ├── sql.nix
│       ├── virtualization.nix
│       ├── core
│       │   ├── boot.nix
│       │   ├── hardware.nix
│       │   ├── tlp.nix
│       │   └── users.nix
│       ├── desktop
│       │   ├── gaming.nix
│       │   ├── niri.nix
│       │   └── sddm.nix
│       ├── packages
│       │   ├── fonts.nix
│       │   └── pkgs.nix
│       ├── security
│       │   ├── hardening.nix       # AppArmor + kernel hardening
│       │   └── network.nix         # Firewall + SSH + fail2ban
│       └── theme
│           └── stylix.nix
└── README.md
```

## Quick Start

```bash
# Clone the repo
git clone <repo-url> ~/System/Configs/NixOS
cd ~/System/Configs/NixOS

# Apply system configuration
sudo nixos-rebuild switch --flake .#moya

# Apply home configuration
home-manager --flake .#ks switch
```

## Aliases

| Alias | Description |
|-------|-------------|
| `sys-up` | Rebuild and switch system config |
| `home-up` | Rebuild and switch home config |
| `flakec` | Open `flake.nix` in Zed |
| `homec` | Open `home/` directory in Zed |
| `sysc` | Open `hosts/` directory in Zed |
| `NixConf` | Open the full config directory in Zed |
| `backup` | Create a timestamped `.7z` backup |
| `backup-clean` | Delete backups older than 7 days |
| `backup-list` | List all backups |
