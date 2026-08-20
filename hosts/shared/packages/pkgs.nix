{ pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "p7zip" "steam" "steam-unwrapped" "steam-original" "steam-run"
    "obsidian" "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    git

    # CLI tools (essential for all users)
    p7zip-rar fzf ripgrep yazi clipman

    # XDG portal (desktop integration)
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk

    mpv imv

    # Development tools (optional, uncomment as needed)
    # gnumake cmake gcc
  ];
}
