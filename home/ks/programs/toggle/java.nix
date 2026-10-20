{ config, lib, pkgs, ... }:

let
  cfg = config.profiles.java;
in
{
  options.profiles.java = {
    enable = lib.mkEnableOption "Java development environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jdk21
      maven
      gradle
      eclipses.eclipse-java
    ];
  };
}
