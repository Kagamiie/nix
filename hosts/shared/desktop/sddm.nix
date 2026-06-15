{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.icewm.enable = true;
  };

  services.displayManager = {
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = false;  # ← Change ici
      settings = {
        General = {
          Session = "niri";
          Locale = "en_US";
        };
      };
    };
    defaultSession = "niri";
  };}
