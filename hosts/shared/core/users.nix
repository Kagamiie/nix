{ config, lib, pkgs, ... }:
{
  users = {
    users.ks = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" ];
      packages = with pkgs; [ ];
    };
    defaultUserShell = pkgs.fish;
  };
}
