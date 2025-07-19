{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.zsh = {
      enable = true;

      localVariables = {
        TERM = "xterm-256color";
      };

      oh-my-zsh.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}