{ config, ... }:
{
  # Prevent Stylix from conflicting with plasma-manager on KDE and Qt theming
  stylix.targets.kde.enable = false;
  stylix.targets.qt.enable = false;

  # KDE's kde-gtk-config overwrites ~/.gtkrc-2.0; allow Home Manager/Stylix to replace it cleanly
  gtk.gtk2.force = true;

  # Disable XDG autostart for blueman-applet everywhere (Niri spawns it directly in config.kdl)
  xdg.configFile."autostart/blueman.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Blueman Applet
    Hidden=true
  '';

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      iconTheme = "Nordzy-purple-dark";
      colorScheme = "Magnesium";

      windowDecorations = {
        library = "org.kde.kwin.aurorae.v2";
        theme = "__aurorae__svg__AquarellePurple";
      };

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
      kwinrc = {
        "org.kde.kdecoration2" = {
          BorderSize = "None";
          BorderSizeAuto = false;
          ButtonsOnLeft = "";
          ButtonsOnRight = "IAX";
        };
      };

      kdeglobals = {
        General = {
          AccentColor = "146,110,228";
          LastUsedCustomAccentColor = "146,110,228";
          accentColorFromWallpaper = false;
        };
      };

      # Disable KDE Baloo background file indexer
      baloofilerc = {
        "Basic Settings" = {
          "Indexing-Enabled" = false;
        };
      };
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
            name = "org.kde.plasma.systemtray";
            config.General = {
              showAllItems = false;

              # Explicitly enable only these plasmoids; all others (keyboardindicator /
              # lock keys, clipboard, devicenotifier, etc.) are disabled.
              # Notifications is in extraItems only -> "Shown when relevant".
              extraItems = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.notifications"
              ];

              shownItems = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.battery"
              ];

              hiddenItems = [
                "org.kde.plasma.bluetooth"
                "steam"
                "vesktop"
              ];

              # Mark built-in tray plasmoids as known so Plasma does not auto-re-enable them
              knownItems = [
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.notifications"
                "org.kde.plasma.cameraindicator"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.weather"
                "org.kde.plasma.battery"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.brightness"
                "org.kde.plasma.keyboardlayout"
                "org.kde.kscreen"
              ];
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

    hotkeys.commands = {
      "launch-foot" = {
        name = "Launch Foot";
        key = "Meta+Return";
        command = "foot";
      };
      "lock-screen" = {
        name = "Lock Screen";
        key = "Meta+Alt+L";
        command = "loginctl lock-session";
      };
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
