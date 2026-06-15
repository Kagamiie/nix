{ config, lib, pkgs, inputs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.xwayland.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # Wine with 32+64bit support
    wineWow64Packages.stable
    winetricks

    (pkgs.writeShellScriptBin "steam" ''
      exec env \
        NIXOS_OZONE_WL=0 \
        STEAM_DISABLE_CEF_GPU=1 \
        ${pkgs.steam}/bin/steam -cef-disable-gpu "$@"
    '')
  ];
}
