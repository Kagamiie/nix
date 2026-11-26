{ pkgs, inputs, ... }:

let
  system     = pkgs.stdenv.hostPlatform.system;
  zen        = inputs.zen-browser.packages.${system}.default;
  quickshell = inputs.quickshell.packages.${system}.default;

  # Add Breeze fallback to Nordzy so missing KDE/Plasma icons render cleanly
  # instead of falling back to hicolor (missing icon placeholder)
  nordzyWithFallback = pkgs.runCommand "nordzy-icon-theme-breeze-fallback" { } ''
    mkdir -p "$out/share/icons"
    for dir in ${pkgs.nordzy-icon-theme}/share/icons/*; do
      name=$(basename "$dir")
      mkdir -p "$out/share/icons/$name"
      if [[ "$name" == *-dark ]]; then
        fallback="breeze-dark,breeze,hicolor"
      else
        fallback="breeze,breeze-dark,hicolor"
      fi
      for item in "$dir"/*; do
        itemName=$(basename "$item")
        if [ "$itemName" = "index.theme" ]; then
          sed "s/^Inherits=hicolor$/Inherits=$fallback/" "$item" > "$out/share/icons/$name/index.theme"
        else
          ln -s "$item" "$out/share/icons/$name/$itemName"
        fi
      done
    done
  '';
in
{
  imports = [
    ../modules/home
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  home = {
    username      = "ks";
    homeDirectory = "/home/ks";
    stateVersion  = "26.05";
    sessionVariables = {
      NO_AT_BRIDGE = "1";
    };
  };

  # Development & tool profiles
  profiles = {
    rust.enable        = true;
    java.enable        = true;
    python.enable      = true;
    antigravity.enable = true;
  };

  home.packages = with pkgs; [
    zen
    quickshell

    # Gaming
    prismlauncher
    lutris
    xivlauncher

    # Media & productivity
    strawberry
    obsidian
    vesktop
    zed-editor

    # Network & file tools
    nmap
    anydesk
    filezilla # FTP

    # Icons
    nordzyWithFallback
  ];
}
