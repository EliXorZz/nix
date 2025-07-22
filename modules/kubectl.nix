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
      plugins = [
        "ctx"
        "ns"
        "neat"
        "stern"
      ];
    };
    
    programs.kubecolor = {
      enable = true;
      enableAlias = true;
      enableZshIntegration = true;
    };

    programs.zsh = {
      initContent = ''
        source <(k stern --completion zsh)
        complete -o default -F __start_stern kubectl stern
      '';

      oh-my-zsh.plugins = [
        "kubectl"
      ];
    };
  };
}