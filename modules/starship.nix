{ config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
      };
    };
  };
}