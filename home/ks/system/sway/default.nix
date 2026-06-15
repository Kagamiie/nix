{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    
    config = {
      modifier = "Mod4";
      terminal = "foot";
      
      bars = [];
      
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "${mod}+Return" = "exec foot";
        "${mod}+Shift+q" = "kill";
        "${mod}+Alt+l" = "exec hyprlock";
        "${mod}+v" = "exec clipman pick -t wofi";


        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+x" = "split h";
        "${mod}+z" = "split v";

        "${mod}+f" = "fullscreen toggle";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+Shift+space" = "floating toggle";
        "${mod}+t" = "focus mode_toggle";
        "${mod}+space" = "focus child";

        "${mod}+a" = "focus parent";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+Shift+f" = "exec swaymsg reload";
        "${mod}+Shift+r" = "restart";

        "${mod}+r" = "mode resize";

        "${mod}+Tab" = "workspace back_and_forth";

        "${mod}+d" = "exec wofi --config";

        "XF86AudioRaiseVolume" = "exec /home/ks/System/Scripts/Automation/volume-control.sh 5 up";
        "XF86AudioLowerVolume" = "exec /home/ks/System/Scripts/Automation/volume-control.sh 5 down";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl set +10%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 2.5%-";
        "Shift+XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "Print" = "exec sh -c 'filepath=\"$HOME/Media/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png\"; grim -g \"$(slurp)\" \"$filepath\" && wl-copy < \"$filepath\"'";

        "${mod}+Shift+Delete" = "exec wlogout -C .config/wlogout/nova.css --buttons-per-row 4";

        "Alt+1" = "exec ~/System/Scripts/Automation/random-wallpaper.sh --once";
        "Alt+2" = "exec swaybg -i ~/System/walls/83726099_p0.jpg -m fill";
      };

      modes = {
        resize = {
          h = "resize shrink width 1 px";
          j = "resize shrink height 1 px";
          k = "resize grow height 1 px";
          l = "resize grow width 1 px";
          Left = "resize shrink width 1 px";
          Down = "resize shrink height 1 px";
          Up = "resize grow height 1 px";
          Right = "resize grow width 1 px";

          "Shift+h" = "resize shrink width 5 px";
          "Shift+j" = "resize shrink height 5 px";
          "Shift+k" = "resize grow height 5 px";
          "Shift+l" = "resize grow width 5 px";
          "Shift+Left" = "resize shrink width 5 px";
          "Shift+Down" = "resize shrink height 5 px";
          "Shift+Up" = "resize grow height 5 px";
          "Shift+Right" = "resize grow width 5 px";

          Return = "mode default";
          Escape = "mode default";
          r = "mode default";
        };
      };

      window = {
        border = 2;
        titlebar = false;
        commands = [
          {
            criteria.workspace = "6";
            command = "layout toggle split";
          }
          {
            criteria.workspace = "9";
            command = "floating enable";
          }
        ];
      };

      gaps = {
        inner = 8;
      };

      workspaceOutputAssign = [
        { workspace = "1"; output = "HDMI-A-1"; }
        { workspace = "2"; output = "HDMI-A-1"; }
        { workspace = "3"; output = "HDMI-A-1"; }
        { workspace = "4"; output = "HDMI-A-1"; }
        { workspace = "5"; output = "HDMI-A-1"; }
        { workspace = "6"; output = "HDMI-A-1"; }
        { workspace = "7"; output = "HDMI-A-1"; }
        { workspace = "8"; output = "HDMI-A-1"; }
        { workspace = "9"; output = "HDMI-A-1"; }
        { workspace = "10"; output = "DP-1"; }
      ];

      colors = {
        focused = {
          background = "#9580ff";
          border = "#9580ff";
          childBorder = "#9580ff";
          indicator = "#9580ff";
          text = "#22212c";
        };
        focusedInactive = {
          background = "#9a9a9a";
          border = "#9a9a9a";
          childBorder = "#9a9a9a";
          indicator = "#9a9a9a";
          text = "#22212c";
        };
        unfocused = {
          background = "#22212c";
          border = "#22212c";
          childBorder = "#22212c";
          indicator = "#22212c";
          text = "#f8f8f2";
        };
        urgent = {
          background = "#ff9580";
          border = "#ff9580";
          childBorder = "#ff9580";
          indicator = "#ff9580";
          text = "#22212c";
        };
        background = "#f8f8f2";
      };

      startup = [
        { command = "waybar"; }
        { command = "swaync"; }
        { command = "wl-paste -t text --watch clipman store"; }
        { command = "~/System/Scripts/Automation/random-wallpaper.sh"; }
         { 
          command = ''
            swayidle -w \
              timeout 300 'hyprlock' \
              timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
              before-sleep 'hyprlock'
          '';
        }
      ];
    };
  };
}