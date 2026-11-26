{
  imports = [
    # Core system configuration
    ./core/boot.nix
    ./core/hardware.nix
    ./core/packages.nix
    ./core/tlp.nix
    ./core/users.nix

    # Desktop, theming & gaming
    ./desktop/gaming.nix
    ./desktop/kde.nix
    ./desktop/niri.nix
    ./desktop/sddm.nix
    ./desktop/stylix.nix

    # Security
    ./security/hardening.nix
    ./security/network.nix

    # Optional services (controlled via systemProfiles.*)
    ./services/sql.nix
    ./services/virtualization.nix
  ];
}
