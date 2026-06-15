{ config, pkgs, lib, ... }:

let
  latitude = 48.8566;  # Paris
  longitude = 2.3522;
in
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    inherit latitude longitude;
    temperature = {
      day = 6500;
      night = 3500;
    };
    settings = {
      general.adjustment-method = "wayland";
    };
  };
}