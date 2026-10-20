# NixOS · moya

> A modular dual-desktop NixOS setup (Niri Wayland compositor + Debloated KDE Plasma 6) - includes security hardening, system-wide theming, and dev tools.

> [!CAUTION]
> This is my personal NixOS configuration. Hardware-specific settings in `hardware-configuration.nix` and user configs may not work out-of-the-box on your machine. Always review and adapt before rebuilding.

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-25.11-5277C3.svg?style=for-the-badge&logo=nixos&logoColor=white)
![KDE Plasma 6](https://img.shields.io/badge/KDE%20Plasma-6-1D99F3.svg?style=for-the-badge&logo=kde&logoColor=white)
![Niri](https://img.shields.io/badge/Niri-Wayland-4C7899.svg?style=for-the-badge)
![Home Manager](https://img.shields.io/badge/Home%20Manager-Enabled-FF6B6B.svg?style=for-the-badge)
![Stylix](https://img.shields.io/badge/Stylix-Theming-A78BFA.svg?style=for-the-badge)
![Flakes](https://img.shields.io/badge/Nix%20Flakes-Enabled-4ECDC4.svg?style=for-the-badge)

</div>

A personal, modular configuration for the **moya** host and the **ks** user. Home Manager is integrated into NixOS, so system and user settings are applied together.

> **Version:** the 25.11 badge above is retained; the flake currently uses the **26.05** branches of NixOS, Home Manager, and Stylix.

## Features

- **Dual desktop**: Niri on Wayland and debloated KDE Plasma 6, with SDDM.
- **Theming**: a dark palette and fonts managed by Stylix, with KDE settings handled by plasma-manager.
- **Security**: AppArmor, kernel hardening, a firewall, Fail2ban, and SSH with root login and password authentication disabled.
- **Tools**: Fish, Foot, Git, Fastfetch, direnv and nix-direnv, ripgrep, fzf, and Yazi.
- **Applications**: Zen Browser, Wayland utilities, media players, and game launchers.
- **Virtualization**: QEMU/KVM with virt-manager, Docker, VMware, and VirtualBox.

## Structure

```text
.
├── flake.nix                     # Inputs and the "moya" NixOS configuration
├── flake.lock                    # Locked dependency versions
├── hosts/
│   ├── moya/                     # Host and hardware configuration
│   └── shared/
│       ├── core/                 # Boot, hardware, and user settings
│       ├── desktop/              # Niri, KDE, SDDM, and gaming
│       ├── packages/             # System packages and fonts
│       ├── security/             # Hardening, networking, and SSH
│       ├── services/             # Virtualization and optional SQL module
│       └── theme/                # Stylix
└── home/ks/
    ├── home.nix                  # Home Manager entry point
    ├── default.nix               # User module imports
    ├── programs/                 # Tools and Java/Python modules
    ├── system/                   # Shell, Plasma, Gammastep, and legacy WM modules
    └── user-apps/                # User applications
```

## Adapt to your machine

This configuration is intended for an existing NixOS installation with flakes enabled.

1. Replace [`hosts/moya/hardware-configuration.nix`](hosts/moya/hardware-configuration.nix) with the configuration generated for your own hardware.
2. Adjust the `ks` user, home directory, and groups in [`hosts/shared/core/users.nix`](hosts/shared/core/users.nix), [`home/ks/home.nix`](home/ks/home.nix), and [`flake.nix`](flake.nix). Also check references to `ks` in other modules.
3. Review boot settings, hardware, the hostname, open ports, and virtualization services in `hosts/shared/`.
4. Customize your Git identity, shell paths and aliases, Plasma settings, and Gammastep location in `home/ks/`.

> [!IMPORTANT]
> In the current repository, `home/ks/default.nix` imports `./toggle/java.nix` and `./toggle/python.nix`, but these files are located in `home/ks/programs/`. Fix these imports before building the configuration.

Do not change `stateVersion` values just to match a newer NixOS release: they control compatibility defaults.

## Build and apply

From the repository root, after adapting the configuration:

```sh
# Build without activating the configuration
sudo nixos-rebuild build --flake .#moya

# Apply the configuration
sudo nixos-rebuild switch --flake .#moya
```

If the repository is tracked by Git, add any required new files with `git add` before building: untracked files are not included in the flake.

To update locked dependencies and rebuild:

```sh
nix flake update
sudo nixos-rebuild build --flake .#moya
sudo nixos-rebuild switch --flake .#moya
```

## Customize

- **System modules**: enable or disable their imports in [`hosts/shared/default.nix`](hosts/shared/default.nix).
- **User modules**: edit [`home/ks/default.nix`](home/ks/default.nix) and [`home/ks/user-apps/default.nix`](home/ks/user-apps/default.nix).
- **Colors and fonts**: [`hosts/shared/theme/stylix.nix`](hosts/shared/theme/stylix.nix).
- **Plasma desktop**: [`home/ks/system/plasma.nix`](home/ks/system/plasma.nix).

Legacy Sway and Wofi modules remain in `home/ks/system/old-wm/`, but are not imported by the current configuration.
