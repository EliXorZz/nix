{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}