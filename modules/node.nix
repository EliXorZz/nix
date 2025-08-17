{ inputs, config, pkgs, username, ... }:

let
  versions = [ "20" "22" "24" ];
  latest = builtins.elemAt versions (builtins.length versions - 1);
in
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs."nodejs_${latest}"
    ];

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