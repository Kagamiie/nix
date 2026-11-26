{ config, pkgs, lib, ... }:

let
  cfg = config.systemProfiles.sql;
in
{
  options.systemProfiles.sql = {
    enable = lib.mkEnableOption "Local MariaDB, Apache/PHP, and Adminer stack";
  };

  config = lib.mkIf cfg.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;

      ensureDatabases = [ "testdb" ];
      ensureUsers = [{
        name = "ks";
        ensurePermissions."testdb.*" = "ALL PRIVILEGES";
      }];
    };

    services.httpd = {
      enable = true;
      enablePHP = true;
      adminAddr = "admin@localhost";

      virtualHosts."localhost" = {
        documentRoot = "/var/www";

        extraConfig = ''
          <Directory "/var/www">
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
            DirectoryIndex index.php index.html
          </Directory>

          <Directory "/var/www/medias">
            Options Indexes FollowSymLinks
            Require all granted
          </Directory>
        '';

        locations."/adminer.php".alias = "${pkgs.adminer}/adminer.php";
      };
    };

    environment.systemPackages = with pkgs; [
      mariadb
      adminer
      wget
      curl
    ];

    systemd.tmpfiles.rules = [ "d /var/www 0755 wwwrun wwwrun - -" ];
  };
}
