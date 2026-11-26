{ ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/nixos
  ];

  networking.hostName = "moya";

  # System profiles enabled on this host
  systemProfiles = {
    niri.enable = true;
    kde.enable = true;
    gaming.enable = true;
    tlp.enable = false;
    sql.enable = false;
    virtualization = {
      libvirt.enable = false;
      docker.enable = false;
      virtualbox.enable = false;
      vmware.enable = false;
    };
  };

  services.flatpak.enable = true;

  # Nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      randomizedDelaySec = "15min";
    };
    optimise.automatic = true;
  };

  time.timeZone = "Europe/Paris";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05"; # Did you read the comment?
}
