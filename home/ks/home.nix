{ config, pkgs, lib, inputs, ... }:

let
  zen        = inputs.zen-browser.packages."x86_64-linux".default;
  quickshell = inputs.quickshell.packages."x86_64-linux".default;
in {
  imports = [ ./default.nix ];

  services.udiskie = {
    enable = true;
    automount = true;
  };

  home = {
    username      = "ks";
    homeDirectory = "/home/ks";
    stateVersion  = "26.05";
  };

  home.packages = with pkgs; [
    zen
    quickshell
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
