{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.uv = {
      enable = true;
    };
  };
}