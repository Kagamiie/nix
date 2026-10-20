{
  imports = [
    # Core system configuration
    ./core/boot.nix
    ./core/users.nix
    # ./core/tlp.nix
    ./core/hardware.nix

    ./desktop/sddm.nix
    ./desktop/niri/default.nix
    ./desktop/kde/default.nix
    ./desktop/games/default.nix

    ./packages/pkgs.nix
    ./packages/fonts.nix

    # Security
    ./security/network.nix
    ./security/hardening.nix

    # Services (Virtualization, SQL, etc..)
    ./services/virtualization.nix
    # ./services/sql.nix
  ];
}
