{ config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      kubectl
    ];

    programs.krewfile = {
      enable = true;
    };
    
    programs.kubecolor = {
      enable = true;
      enableAlias = true;
      enableZshIntegration = true;
    };
  };
}