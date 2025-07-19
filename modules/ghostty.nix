{ config, pkgs, username, ... }:

{
  homebrew = {
    enable = true;
    casks = [
      "ghostty"
    ];
  };

  home-manager.users.${username} = {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;

      package = null;

      settings = {
        theme = "dracula";

        title = "Terminal";
        macos-titlebar-style = "tabs";

        window-padding-x = 20;
        window-padding-y = 20;

        background-opacity = 0.7;
        background-blur-radius = 20;
        mouse-hide-while-typing = true;

        quick-terminal-position = "center";
        keybind = global:alt+t=toggle_quick_terminal;
      };
    };
  };
}