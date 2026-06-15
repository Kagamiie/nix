{
  imports = [
    ./core/boot.nix
    ./core/users.nix
    ./core/tlp.nix

    ./core/hardware.nix

    ./desktop/sddm.nix
    ./desktop/niri.nix
    ./desktop/gaming.nix

    ./packages/pkgs.nix
    ./packages/fonts.nix

    ./theme/stylix.nix

    ./security/network.nix
    ./security/hardening.nix

    ./virtualization.nix
    ./sql.nix
  ];
}
