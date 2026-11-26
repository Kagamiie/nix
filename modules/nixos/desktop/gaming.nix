{ config, lib, pkgs, ... }:

let
  cfg = config.systemProfiles.gaming;
in
{
  options.systemProfiles.gaming = {
    enable = lib.mkEnableOption "Gaming support (Steam, Wine, GameMode)";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.xwayland.enable = true;
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      package = pkgs.steam.override {
        extraEnv = {
          NIXOS_OZONE_WL = "0";
          STEAM_DISABLE_CEF_GPU = "1";
        };
        extraArgs = "-cef-disable-gpu";
      };
    };

    environment.systemPackages = with pkgs; [
      # Wine with 32+64bit support
      wineWow64Packages.stable
      winetricks
    ];
  };
}
