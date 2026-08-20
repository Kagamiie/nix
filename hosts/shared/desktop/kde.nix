{ config, pkgs, ... }:

{
  desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs; [ 
    dolphin
    xarchiver
    kdeconnect
    kcalc
  ];

  # KDE services
  services.kwallet.enable = true;
  services.baloo.enable = true;

  # Optional: keep SDDM minimal (both DEs share the same display manager)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };
}
