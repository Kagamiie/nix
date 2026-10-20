# hosts/shared/security/network.nix
{ ... }:

{
  networking = {
    hostName = "moya";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 27015 ];
      allowedUDPPorts = [ 27015 ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
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
