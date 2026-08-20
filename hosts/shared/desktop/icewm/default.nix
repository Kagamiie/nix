{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.icewm.enable = true;
  };
}
