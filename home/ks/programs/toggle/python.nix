{ config, lib, pkgs, ... }:

let
  cfg = config.profiles.python;
in
{
  options.profiles.python = {
    enable = lib.mkEnableOption "Python data science environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      vscodium
      (pkgs.python312.withPackages (ps: with ps; [
        jupyter
        ipykernel
        scapy
        numpy
        matplotlib
      ]))
    ];
  };
}
