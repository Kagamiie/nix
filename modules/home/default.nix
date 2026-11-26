{
  imports = [
    # Desktop
    ./desktop/gammastep.nix
    ./desktop/plasma.nix

    # Programs
    ./programs/fastfetch.nix
    ./programs/foot.nix
    ./programs/git.nix
    ./programs/shell.nix

    # Optional dev/tool profiles (controlled via profiles.*)
    ./profiles/ai.nix
    ./profiles/java.nix
    ./profiles/python.nix
    ./profiles/rust.nix
  ];
}
