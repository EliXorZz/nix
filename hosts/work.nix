{ config, pkgs, home-manager, ... }:

let
  username = "dylan";
  home = "/Users/${username}";
in
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = username;

  imports = [
    ../modules/brew.nix
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
        userName = "Jane Doe";
        userEmail = "jane.doe@example.org";
      };

      programs.home-manager.enable = true;
    };
  };
}