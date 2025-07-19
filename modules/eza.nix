{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}