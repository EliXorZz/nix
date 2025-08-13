{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.aerospace = {
      enable = true;
      userSettings = {
        start-at-login = true;

        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;

        accordion-padding = 20;

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
          alt-ctrl-backspace = "";
          alt-ctrl-enter = "";

          alt-ctrl-left = "";
          alt-ctrl-down = "";
          alt-ctrl-up = "";
          alt-ctrl-right = "";

          alt-cmd-left = "";
          alt-cmd-down = "";
          alt-cmd-up = "";
          alt-cmd-right = "";

          alt-x = "";
          alt-y = "";

          ctrl-1 = "workspace 1";
          ctrl-2 = "workspace 2";
          ctrl-3 = "workspace 3";
          ctrl-4 = "workspace 4";
          ctrl-5 = "workspace 5";
          ctrl-6 = "workspace 6";
          ctrl-7 = "workspace 7";
          ctrl-8 = "workspace 8";
          ctrl-9 = "workspace 9";

          ctrl-f = "workspace Main";

          ctrl-shift-1 = "move-node-to-workspace 1";
          ctrl-shift-2 = "move-node-to-workspace 2";
          ctrl-shift-3 = "move-node-to-workspace 3";
          ctrl-shift-4 = "move-node-to-workspace 4";
          ctrl-shift-5 = "move-node-to-workspace 5";
          ctrl-shift-6 = "move-node-to-workspace 6";
          ctrl-shift-7 = "move-node-to-workspace 7";
          ctrl-shift-8 = "move-node-to-workspace 8";
          ctrl-shift-9 = "move-node-to-workspace 9";

          ctrl-shift-f = "move-node-to-workspace Main";

          alt-tab = "workspace-back-and-forth";
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

          alt-shift-p = "mode service";
        };

        mode.service.binding = {
          esc = ["reload-config" "mode main"];
          r = ["flatten-workspace-tree" "mode main"];
          f = ["layout floating tiling" "mode main"];
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
      };
    };
  };
}