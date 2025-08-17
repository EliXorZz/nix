{ inputs, config, pkgs, home-manager, ... }:

let
  username = "dylan";
  home = "/Users/${username}";

  importModules = modules: map (m: import m { inherit inputs config pkgs username; }) modules;
in
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = username;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
  };

  imports = importModules [
    ../modules/fastfetch.nix

    ../modules/battery-toolkit.nix
    ../modules/aerospace.nix

    ../modules/ghostty.nix
    ../modules/bruno.nix

    ../modules/orbstack.nix

    ../modules/starship.nix
    ../modules/zsh.nix

    ../modules/bat.nix
    ../modules/fzf.nix
    ../modules/eza.nix
    ../modules/btop.nix
    ../modules/nmap.nix

    ../modules/ffmpeg.nix
    ../modules/go.nix
    ../modules/php.nix
    ../modules/node.nix

    ../modules/uv.nix

    ../modules/kubectl.nix
    ../modules/k9s.nix
    ../modules/fluxcd.nix
  ];

  users.users.${username} = {
    name = username;
    home = home;
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${username} = {
      home.stateVersion = "25.05";

      programs.git = {
        enable = true;
        userName = "Dylan Bättig";
        userEmail = "dylan.battig@gmail.com";
      };

      programs.home-manager.enable = true;

      home.shellAliases = {
        nix-shell = "nix-shell --run /bin/zsh";
      };
    };
  };
}