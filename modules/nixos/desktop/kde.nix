{ config, pkgs, lib, ... }:

let
  cfg = config.systemProfiles.kde;
in
{
  options.systemProfiles.kde = {
    enable = lib.mkEnableOption "KDE Plasma 6 desktop environment";
  };

  config = lib.mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
    services.power-profiles-daemon.enable = false;

    # Disable unused services pulled in by Plasma 6 by default
    services.geoclue2.enable = false;
    services.orca.enable = false;
    services.speechd.enable = false;

    # Mask drkonqi crash handler (prevents SIGABRT coredump loops when no display is ready)
    # and KDE UnifiedPush distributor (runs even under Niri)
    systemd.services."drkonqi-coredump-processor@" = {
      enable = false;
      wantedBy = lib.mkForce [ ];
    };
    systemd.user.sockets."drkonqi-coredump-launcher".enable = false;
    systemd.user.services."drkonqi-coredump-launcher@".enable = false;
    systemd.user.services."kunifiedpush-distributor".enable = false;

    xdg.portal.config.kde = {
      default = lib.mkDefault [ "kde" ];
    };

    environment.systemPackages = with pkgs; [
      kdePackages.kcalc
      xarchiver
    ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      # Screenshot & Media
      spectacle                   # Screenshot / QR code tool
      gwenview                    # Image viewer
      elisa                       # Music player

      # Editors & Documents
      kate                        # Advanced text editor
      okular                      # Document/PDF viewer
      # kwrite                    # Basic text editor

      # Utilities
      ark                         # Archive manager (replaced by xarchiver)
      konsole                     # Terminal
      khelpcenter                 # KDE Help Center
    ];
  };
}
