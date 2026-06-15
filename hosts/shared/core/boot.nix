{ config, pkgs, ... }:

{
  environment.shells = with pkgs; [ fish ];
  programs.fish.enable = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
