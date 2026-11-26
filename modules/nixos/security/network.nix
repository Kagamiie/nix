{ ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      # Port 22 is opened automatically by services.openssh
      # Steam ports are managed by programs.steam.*.openFirewall
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      MaxAuthTries = 3;
      LoginGraceTime = 30;
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    ignoreIP = [ "127.0.0.0/8" "10.0.0.0/8" "192.168.0.0/16" ];
  };
}
