{ pkgs, ... }:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite swayidle hyprlock wlogout
    wl-clipboard swaybg grim slurp wofi wdisplays
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
  security.polkit.enable = true;

}
