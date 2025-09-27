{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.aerospace = {
      enable = true;
      userSettings = {
        start-at-login = true;

        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;

        accordion-padding = 0;

        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";

        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

        automatically-unhide-macos-hidden-apps = true;

        key-mapping.preset = "qwerty";

        gaps = {
          inner.horizontal = 0;
          inner.vertical = 0;

          outer.left = 0;
          outer.right = 0;
          outer.bottom = 0;
          outer.top = 0;
        };

        mode.main.binding = {
          # alt-ctrl-backspace = "";
          # alt-ctrl-enter = "";

          alt-ctrl-left = "move left";
          alt-ctrl-down = "move down";
          alt-ctrl-up = "move up";
          alt-ctrl-right = "move right";

          alt-cmd-left = "focus left";
          alt-cmd-down = "focus down";
          alt-cmd-up = "focus up";
          alt-cmd-right = "focus right";

          alt-x = "resize smart +50";
          alt-y = "resize smart -50";

          ctrl-1 = "workspace 1";
          ctrl-2 = "workspace 2";
          ctrl-3 = "workspace 3";
          ctrl-4 = "workspace 4";
          ctrl-5 = "workspace 5";
          ctrl-6 = "workspace 6";
          ctrl-7 = "workspace 7";
          ctrl-8 = "workspace 8";
          ctrl-9 = "workspace 9";

          ctrl-shift-1 = "move-node-to-workspace 1 --focus-follows-window";
          ctrl-shift-2 = "move-node-to-workspace 2 --focus-follows-window";
          ctrl-shift-3 = "move-node-to-workspace 3 --focus-follows-window";
          ctrl-shift-4 = "move-node-to-workspace 4 --focus-follows-window";
          ctrl-shift-5 = "move-node-to-workspace 5 --focus-follows-window";
          ctrl-shift-6 = "move-node-to-workspace 6 --focus-follows-window";
          ctrl-shift-7 = "move-node-to-workspace 7 --focus-follows-window";
          ctrl-shift-8 = "move-node-to-workspace 8 --focus-follows-window";
          ctrl-shift-9 = "move-node-to-workspace 9 --focus-follows-window";

          alt-tab = "workspace-back-and-forth";
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

          alt-shift-p = "mode service";
        };

        mode.service.binding = {
          esc = ["reload-config" "mode main"];
          r = ["flatten-workspace-tree" "mode main"];
          f = ["layout floating tiling" "mode main"];
          l = ["layout accordion" "mode main"];
          backspace = ["close-all-windows-but-current" "mode main"];

          left = ["join-with left" "mode main"];
          down = ["join-with down" "mode main"];
          up = ["join-with up" "mode main"];
          right = ["join-with right" "mode main"];
        };

        workspace-to-monitor-force-assignment = {
          "1" = "main";
          "2" = "secondary";
        };

        on-window-detected = [
          {
            "if".workspace = "9";
            run = "layout floating";
          }
          {
            "if".workspace = "8";
            run = "layout floating";
          }

          {
            "if" = {
              app-name-regex-substring = "IntelliJ|PhpStorm|WebStorm|PyCharm|GoLand";
            };
            "run" = [
              "move-node-to-workspace 1 --focus-follows-window"
            ];
          }

          {
            "if" = {
              app-id = "com.mitchellh.ghostty";
            };
            "run" = [
              "move-node-to-workspace 2 --focus-follows-window"
            ];
          }
          {
            "if" = {
              app-id = "org.mozilla.firefox";
            };
            "run" = [
              "move-node-to-workspace 3 --focus-follows-window"
            ];
          }
          {
            "if" = {
              app-id = "com.openai.chat";
            };
            "run" = [
              "move-node-to-workspace 7 --focus-follows-window"
            ];
          }
          {
            "if" = {
              app-id = "com.spotify.client";
            };
            "run" = [
              "move-node-to-workspace 9 --focus-follows-window"
            ];
          }
          {
            "if" = {
              app-id = "com.hnc.Discord";
            };
            "run" = [
              "move-node-to-workspace 9 --focus-follows-window"
            ];
          }
          {
            "if" = {
              app-id = "com.apple.finder";
            };
            "run" = [
              "layout floating"
            ];
          }
        ];
      };
    };
  };
}