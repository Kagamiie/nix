{ ... }:

let
  latitude  = 48.8566; # Paris
  longitude = 2.3522;
in
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    inherit latitude longitude;
    temperature = {
      day = 6500;
      night = 3500;
    };
    settings = {
      general.adjustment-method = "wayland";
    };
  };

  # Only run Gammastep under Niri (KDE Plasma has its own built-in Night Light)
  systemd.user.services.gammastep.Unit.ConditionEnvironment = "XDG_CURRENT_DESKTOP=niri";
}
