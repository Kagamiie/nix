{ config, pkgs, lib, ... }:

{
  imports = [
    ../../theme/stylix.nix
  ];

  programs.niri.enable = true;

  # Niri-specific packages
  environment.systemPackages = with pkgs; [
    # Niri utilities
    xwayland-satellite
    swayidle
    hyprlock
    wlogout
    blueman

    # Media & screenshot tools (wayland)
    wl-clipboard
    swaybg
    grim
    slurp

    # Display management
    wdisplays
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}
