{ config, pkgs, ... }:

{
  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.extraConfig = {
      "10-disable-camera".wireplumber.profiles.main."monitor.libcamera" = "disabled";
    };
  };

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };

  # Screen
  services.colord.enable = true;

  environment.systemPackages = with pkgs; [
    pulseaudio alsa-utils brightnessctl pavucontrol bluetuith
  ];
}
