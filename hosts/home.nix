{ config, pkgs, home-manager, ... }:

let
  username = "dylan";
  home = "/Users/${username}";

  importModules = modules: map (m: import m { inherit config pkgs username; }) modules;
in
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = username;

  imports = importModules [
    ../modules/fastfetch.nix

    ../modules/ghostty.nix
    ../modules/starship.nix
    ../modules/zsh.nix

    ../modules/eza.nix
    ../modules/btop.nix
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
    };
  };
}