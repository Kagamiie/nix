# NixOS · moya

> A modular dual-desktop NixOS setup (Niri Wayland compositor + Debloated KDE Plasma 6) - includes security hardening, system-wide theming, and dev tools.

> [!CAUTION]
> This is my personal NixOS configuration. Hardware-specific settings in `hosts/moya/hardware.nix` and user configs may not work out-of-the-box on your machine. Always review and adapt before rebuilding.

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-26.05-5277C3.svg?style=for-the-badge&logo=nixos&logoColor=white)
![KDE Plasma 6](https://img.shields.io/badge/KDE%20Plasma-6-1D99F3.svg?style=for-the-badge&logo=kde&logoColor=white)
![Niri](https://img.shields.io/badge/Niri-Wayland-4C7899.svg?style=for-the-badge)
![Home Manager](https://img.shields.io/badge/Home%20Manager-Enabled-FF6B6B.svg?style=for-the-badge)
![Stylix](https://img.shields.io/badge/Stylix-Theming-A78BFA.svg?style=for-the-badge)
![Flakes](https://img.shields.io/badge/Nix%20Flakes-Enabled-4ECDC4.svg?style=for-the-badge)

</div>

A personal, modular configuration for the **moya** host and the **ks** user. Home Manager is integrated into NixOS, so system and user settings are applied together.

## Features

- **Dual desktop**: Niri on Wayland and debloated KDE Plasma 6, with SDDM and per-desktop XDG portals.
- **Theming**: a dark palette and fonts managed by Stylix, with KDE settings handled by plasma-manager.
- **Security**: AppArmor, kernel hardening, a firewall, Fail2ban, and SSH with root login and password/keyboard-interactive authentication disabled.
- **Tools**: Fish, Foot, Git, Fastfetch, direnv and nix-direnv, ripgrep, fzf, and Yazi (with Fish integration).
- **Applications**: Zen Browser, Wayland utilities, media players, Wireshark, and game launchers (Steam + GameMode + Wine).
- **Optional services**: toggleable via `systemProfiles.*` — TLP, QEMU/KVM (`libvirtd`), Docker, VMware, VirtualBox, and a local MariaDB/Apache/PHP/Adminer stack.

## Structure

```text
.
├── flake.nix                     # Inputs and the "moya" NixOS configuration
├── flake.lock                    # Locked dependency versions
├── hosts/
│   └── moya/
│       ├── default.nix           # Hostname, systemProfiles.*, and Nix settings
│       └── hardware.nix          # Auto-generated hardware configuration
├── modules/
│   ├── nixos/
│   │   ├── default.nix           # System module imports
│   │   ├── core/                 # Boot, hardware, base packages, TLP, and users
│   │   ├── desktop/              # Gaming, KDE Plasma 6, Niri, SDDM, and Stylix
│   │   ├── security/             # Kernel/AppArmor hardening, firewall, and SSH
│   │   └── services/             # Optional SQL and virtualization modules
│   └── home/
│       ├── default.nix           # User module imports
│       ├── desktop/              # Gammastep (Niri) and Plasma (plasma-manager)
│       ├── programs/             # Fastfetch, Foot, Git, and Fish/nh/fzf/Yazi/direnv
│       └── profiles/             # Optional dev/tool profiles (ai, java, python, rust)
└── home/
    └── ks.nix                    # User entry point (profiles.* toggles & user apps)
```

## Adapt to your machine

This configuration is intended for an existing NixOS installation with flakes enabled.

1. Replace [`hosts/moya/hardware.nix`](hosts/moya/hardware.nix) with the configuration generated for your own hardware.
2. Adjust the hostname and `systemProfiles.*` toggles in [`hosts/moya/default.nix`](hosts/moya/default.nix).
3. Adjust the `ks` user, home directory, and groups in [`modules/nixos/core/users.nix`](modules/nixos/core/users.nix), [`home/ks.nix`](home/ks.nix), and [`flake.nix`](flake.nix). Also check references to `ks` in other modules.
4. Customize your Git identity, shell paths and aliases, Plasma settings, and Gammastep location in `modules/home/`.

Do not change `stateVersion` values just to match a newer NixOS release: they control compatibility defaults.

## Build and apply

From the repository root, after adapting the configuration:

```sh
# With nh (recommended — shows package diff and asks confirmation)
nh os switch --ask ~/System/nix

# Or directly with nixos-rebuild
sudo nixos-rebuild switch --flake .#moya
```

If the repository is tracked by Git, add any required new files with `git add` before building: untracked files are not included in the flake.

To update locked dependencies and rebuild:

```sh
nix flake update
nh os switch --ask ~/System/nix
```

## Customize

- **System profiles**: toggle `systemProfiles.*` in [`hosts/moya/default.nix`](hosts/moya/default.nix) (`niri`, `kde`, `gaming`, `tlp`, `sql`, `virtualization.*`).
- **User profiles & apps**: toggle `profiles.*` and user packages in [`home/ks.nix`](home/ks.nix).
- **Colors and fonts**: [`modules/nixos/desktop/stylix.nix`](modules/nixos/desktop/stylix.nix).
- **Plasma desktop**: [`modules/home/desktop/plasma.nix`](modules/home/desktop/plasma.nix).
