{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "p7zip"
  ];

  environment.systemPackages = with pkgs; [
    pulseaudio brightnessctl bluez alsa-utils

    libqalculate killall p7zip-rar fastfetch

    gcc-arm-embedded
    gnumake cmake gcc libgcc

    ranger alacritty git

    fzf ripgrep nodejs
    feh flameshot dunst
    picom rofi polybar
  ];
}
