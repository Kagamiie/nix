{ config, pkgs, lib, ... }:

let
  cfg = config.systemProfiles.niri;
in
{
  options.systemProfiles.niri = {
    enable = lib.mkEnableOption "Niri Wayland compositor";
  };

  config = lib.mkIf cfg.enable {
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
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
      config.niri = {
        default = [ "gnome" "gtk" ];
      };
    };
  };
}
