{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.power-profiles-daemon.enable = false;

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
    # kwrite                      # Basic text editor

    # Utilities
    ark                         # Archive manager (replaced by xarchiver)
    konsole                     # Terminal
    khelpcenter                 # KDE Help Center
  ];
}
