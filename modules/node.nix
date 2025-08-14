{ inputs, config, pkgs, username, ... }:

let
  versions = [ "18" "20" "22" "24" ];
in
{
  home-manager.users.${username} = {
    home.shellAliases = builtins.listToAttrs (
      map (version: let
        cmd = "nix-shell -p nodejs_${version}";
      in {
        name = "node${version}";
        value = cmd;
      })
      versions
    );
  };
}