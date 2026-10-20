{ config, pkgs, lib, ... }:

{
  services.displayManager = {
    sddm = {
      enable = true;

      wayland.enable = true;

      settings = {
        General = {
          Locale = "en_US";
        };
      };
    };

    defaultSession = "niri";
  };
}
