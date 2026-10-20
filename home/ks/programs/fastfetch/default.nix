{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        padding = { right = 2; };
      };
      display = {
        color = "blue";
        separator = "  ";
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "shell"
        "display"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "battery"
        "locale"
        "break"
        "colors"
      ];
    };
  };
}
