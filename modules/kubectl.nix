{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    imports = [
      inputs.krewfile.homeManagerModules.krewfile
    ];

    home.packages = with pkgs; [
      kubectl
    ];

    programs.krewfile = {
      enable = true;
      krewPackage = pkgs.krew;
    };
    
    programs.kubecolor = {
      enable = true;
      enableAlias = true;
      enableZshIntegration = true;
    };

    programs.zsh.oh-my-zsh = {
      plugins = [
        "kubectl"
      ];
    };
  };
}