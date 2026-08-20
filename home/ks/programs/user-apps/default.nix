{ pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    xivlauncher
    heroic
    unityhub alcom blender

    strawberry      # Music player
    obsidian        # Note-taking

    filezilla       # FTP client
    vesktop         # Discord client
    wireshark       # Network analyzer

    zed-editor      # Code editor
  ];
}
