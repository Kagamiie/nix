{ config, lib, pkgs, ... }:
{
  users.users.ks = {
    isNormalUser = true;
    description = "ks";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "ks";

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
