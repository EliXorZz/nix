{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.btop = {
      enable = true;
    };
  };
}