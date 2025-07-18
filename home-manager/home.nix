{ config, pkgs, lib, inputs, ... }:

let
  Aliases = {
    # System management
    home-up = "home-manager --flake ~/Documents/NixOS/. switch";
    sys-up = "sudo nixos-rebuild switch --flake ~/Documents/NixOS/.#ks-nixos";
    #sys-up = "sudo nixos-rebuild switch --flake ~/Documents/NixOS#ks-nixos";
    
    # Quick config editing
    flakec = "nano ~/Documents/NixOS/flake.nix";
    homec = "nano ~/Documents/NixOS/home-manager/home.nix";
    sysc = "nano ~/Documents/NixOS/nixos/configuration.nix";

  };
in {
  home = {
    username = "ks";
    homeDirectory = "/home/ks";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian" "stremio-shell" "stremio-server"
  ];

  home.packages = with pkgs; [
    prismlauncher
    texliveFull pandoc
    neovim vscodium obsidian

    stremio ani-cli

    python312 python312Packages.pip
    nmap sqlmap gobuster wireshark

    flameshot oh-my-zsh
    inputs.zen-browser.packages."x86_64-linux".default
  ];

  # Shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = Aliases;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
      plugins = [
        "git"
        "sudo"
        "docker"
        "kubectl"
        "history-substring-search"
      ];
    };
  };  
  
  programs.git = {
    enable = true;
    userName = "Kagamiie";
    userEmail = "cakic.lukasrb@gmail.com"; # Change this
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # Services
  services = {
    # Wallpaper rotation (uncomment if desired)
    # random-background = {
    #   enable = true;
    #   imageDirectory = "%h/Pictures/Wallpapers";
    #   interval = "30m";
    # };
    
    # Notifications
    #dunst = {
    #  enable = true;
    #  settings = {
    #    global = {
    #      geometry = "300x5-30+20";
    #      transparency = 10;
    #      frame_color = "#eceff1";
    #      font = "Droid Sans 9";
    #    };
    #  };
    #};
  };


  programs.home-manager.enable = true;
}
