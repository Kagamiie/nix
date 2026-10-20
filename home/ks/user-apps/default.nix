{ pkgs, ... }:

{
  profiles.java.enable = true;
  profiles.python.enable = true;

  home.packages = with pkgs; [
    prismlauncher
    xivlauncher
    heroic

    strawberry
    obsidian

    filezilla
    vesktop
    wireshark

    zed-editor
  ];
}
