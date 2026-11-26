{ pkgs, ... }:
{
  environment.shells = with pkgs; [ fish ];
  programs.fish.enable = true;

  users = {
    users.ks = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "wireshark" ];
    };
    defaultUserShell = pkgs.fish;
  };
}
