{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      fluxcd
    ];

    programs.zsh.oh-my-zsh.plugins = [
      "fluxcd"
    ];
  };
}