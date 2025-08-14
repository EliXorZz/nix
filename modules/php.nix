{ inputs, config, pkgs, username, ... }:

let
  versions = [ "81" "82" "83" "84" ];
  extensions = [ "redis" ];
in
{
  home-manager.users.${username} = {
    home.shellAliases = builtins.listToAttrs (
      map (version: let
        cmd = "nix-shell -p 'php${version}.withExtensions ({ all, enabled }: enabled ++ (with all; [ ${builtins.concatStringsSep " " extensions} ]))' php${version}Packages.composer";
      in {
        name = php;
        value = "php${version}";
      })
      versions
    );
  };
}