{
  imports = [
    # Core system configuration
    ./core/boot.nix
    ./core/users.nix
    ./core/tlp.nix
    ./core/hardware.nix

    ./desktop/sddm.nix
    ./desktop/niri/default.nix
    ./desktop/kde.nix
    ./desktop/gaming.nix

    ./packages/pkgs.nix
    ./packages/fonts.nix

    # Security
    ./security/network.nix
    ./security/hardening.nix

    # Theme
    ./theme/stylix.nix

    # Virtualization & services
    # ./virtualization.nix
    # ./sql.nix
  ];
}
