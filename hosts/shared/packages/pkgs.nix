{ pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "p7zip" "steam" "steam-unwrapped" "steam-original" "steam-run"
    "obsidian"
  ];

  environment.systemPackages = with pkgs; [
    foot git

    p7zip-rar fzf ripgrep yazi clipman

    mpv playerctl imv

    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk

    # gnumake cmake gcc
  ];
}
