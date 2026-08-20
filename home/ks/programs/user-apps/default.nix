{ pkgs, ... }:

{
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
