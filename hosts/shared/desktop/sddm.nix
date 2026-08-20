{ config, pkgs, lib, ... }:

{
  services.displayManager = {
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = false;
      settings = {
        General = {
          Session = "niri";
          Locale = "en_US";
        };
      };
    };
    defaultSession = "niri";
  };
}
