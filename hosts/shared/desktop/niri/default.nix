{ config, pkgs, lib, ... }:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  # Niri-specific packages
  environment.systemPackages = with pkgs; [
    # Terminal (niri-specific)
    foot

    # Niri utilities
    xwayland-satellite
    swayidle
    hyprlock
    wlogout

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

  programs.foot = {
    enable = true;

    settings = {
      main = {
        pad = "20x20";
        font = lib.mkForce "monospace:size=12";
      };

      scrollback = {
        lines = 100000;
      };

      colors-dark = lib.mkForce {
        foreground = "ffffff";
        background = "161616";
        regular0 = "262626";
        regular1 = "ff7eb6";
        regular2 = "42be65";
        regular3 = "ffe97b";
        regular4 = "33b1ff";
        regular5 = "ee5396";
        regular6 = "3ddbd9";
        regular7 = "dde1e6";
        bright0 = "393939";
        bright1 = "ff7eb6";
        bright2 = "42be65";
        bright3 = "ffe97b";
        bright4 = "33b1ff";
        bright5 = "ee5396";
        bright6 = "3ddbd9";
        bright7 = "ffffff";
      };
    };
  };

  security.polkit.enable = true;
}
