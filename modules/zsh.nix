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
      ];
    };
  };
}