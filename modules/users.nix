{ config, lib, pkgs, ... }:
{
  users.users.ks = {
    isNormalUser = true;
    description = "ks";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "ks";
}
