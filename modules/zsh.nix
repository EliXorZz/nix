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

      plugins = [
        {
          name = "zsh-shift-select";
          src = pkgs.fetchFromGitHub {
            owner = "jirutka";
            repo = "zsh-shift-select";
            rev = "v0.1.1";
            sha256 = "sha256-4kUUBH2GTMb/d6PUNiSNFogkvDUSwMX823j4xsroJKs=";
          };
        }

        # {
        #   name = "zsh-system-clipboard";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "kutsan";
        #     repo = "zsh-system-clipboard";
        #     rev = "v0.8.0";
        #     sha256 = "sha256-VWTEJGudlQlNwLOUfpo0fvh0MyA2DqV+aieNPx/WzSI=";
        #   };
        # }
      ];
    };
  };
}