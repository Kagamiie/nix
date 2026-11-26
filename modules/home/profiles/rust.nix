{ config, lib, pkgs, ... }:

let
  cfg = config.profiles.rust;
in
{
  options.profiles.rust = {
    enable = lib.mkEnableOption "Rust development environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnumake
      cmake
      gcc
      rustc
      cargo
      rustfmt
      clippy
      rust-analyzer
      pkg-config
      openssl
    ];
  };
}
