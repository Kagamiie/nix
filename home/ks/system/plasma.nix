{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      iconTheme = "Nordzy-purple-dark";
      colorScheme = "Magnesium";

      cursor = {
        theme = "miku-cursor-linux";
        size = 32;
      };

      wallpaperSlideShow = {
        path = "${config.home.homeDirectory}/Documents/Medias/Wallpapers/";
        interval = 300;
      };
    };

    configFile = {
      kdeglobals = {
        General = {
          AccentColor = "146,110,228";
          LastUsedCustomAccentColor = "146,110,228";
          accentColorFromWallpaper = false;
        };
      };

      files."kwinrc".value = ''
        [org.kde.kdecoration2]
        BorderSize=None
        BorderSizeAuto=false
        ButtonsOnLeft=
        ButtonsOnRight=IAX
        library=org.kde.kwin.aurorae.v2
        theme=__aurorae__svg__AquarellePurple
      '';
    };

    panels = [
      {
        location = "top";
        height = 41;
        floating = false;

        widgets = [
          {
            kickoff = {
              icon = "nix-snowflake-white";
            };
          }

          {
            iconTasks = {
              launchers = [
                "applications:zen-beta.desktop"
                "applications:foot.desktop"
                "applications:dev.zed.Zed.desktop"
                "applications:org.kde.dolphin.desktop"
              ];

              appearance = {
                showTooltips = true;
              };
            };
          }

          "org.kde.plasma.panelspacer"
          "org.kde.plasma.mediacontroller"
          "org.kde.plasma.panelspacer"

          {
            systemTray = {
              items = {
                showAll = false;

                shown = [
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.volume"
                  "org.kde.plasma.battery"
                ];

                hidden = [
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.notifications"
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.mediacontroller"
                  "org.ayatana.NotificationItem.steam"
                  "org.blueman.sni"
                  "org.kde.plasma.brightness"
                ];
              };
            };
          }

          {
            digitalClock = {
              date.enable = false;
              time.format = "12h";
            };
          }
        ];
      }
    ];

    shortcuts = {
      kwin = {
        "Window Close" = "Meta+Shift+Q";
        "Window Maximize" = "Meta+F";
        "Window Fullscreen" = "Meta+Shift+F";
      };
    };

    input.touchpads = [
      {
        name = "ELAN0683:00 04F3:320B Touchpad";
        vendorId = "04f3";
        productId = "320b";
        disableWhileTyping = false;
      }
    ];

    hotkeys.commands."launch-foot" = {
      name = "Launch Foot";
      key = "Meta+Return";
      command = "foot";
    };
    hotkeys.commands."lock-screen" = {
      name = "Lock Screen";
      key = "Meta+Alt+L";
      command = "loginctl lock-session";
    };
    hotkeys.commands = {
      brightness-down = {
        name = "Brightness Down";
        key = "F5";
        command = "brightnessctl set 5%- -d intel_backlight";
      };

      brightness-up = {
        name = "Brightness Up";
        key = "F6";
        command = "brightnessctl set 5%+ -d intel_backlight";
      };
    };
  };
}
