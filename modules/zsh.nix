{ config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.zsh = {
      enable = true;
      localVariables = {
        TERM = "xterm-256color";
      };

      syntaxHighlighting = {
        enable = true;
      };

      oh-my-zsh = {
        enable = true;
        plugins = [

        ];
      };
    };
  };
}