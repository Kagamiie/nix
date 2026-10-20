{ config, pkgs, lib, ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      # CPU Performance
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 100;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      # Platform Profile
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      # Kernel laptop mode
      NMI_WATCHDOG = 0;

      # Energy savings
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";
      WOL_DISABLE = "Y";

      # Sound power saving
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;

      # Runtime power management
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";

      # USB autosuspend
      USB_AUTOSUSPEND = 0;
      USB_EXCLUDE_AUDIO = 1;
      USB_EXCLUDE_BTUSB = 0;
      USB_EXCLUDE_PHONE = 0;
      USB_EXCLUDE_PRINTER = 1;
      USB_EXCLUDE_WWAN = 0;

      # SATA link power management
      SATA_LINKPWR_ON_AC = "max_performance";
      SATA_LINKPWR_ON_BAT = "min_power";

      # PCIe power management
      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };

  # Disable conflicting services
  services.thermald.enable = false;
  powerManagement.enable = false;

  boot.kernelParams = [
    "quiet"
    "intel_pstate=passive"
    "mem_sleep_default=deep"
  ];

  services.udev.extraRules = ''
    # Let TLP handle power management
  '';

  systemd.services = {
    NetworkManager-wait-online.enable = lib.mkForce false;
    systemd-udev-settle.enable = false;
    tlp.after = [ "multi-user.target" ];
  };
}
