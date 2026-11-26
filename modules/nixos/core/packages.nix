{ pkgs, ... }:

{
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  environment.systemPackages = with pkgs; [
    git
    appimage-run

    # CLI tools (essential for all users)
    p7zip-rar
    ripgrep
    clipman

    # Media viewers
    mpv
    imv
  ];
}
