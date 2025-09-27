{ inputs, config, pkgs, username, ... }:

let
  versions = [ "1_22" "1_23" "1_24" "1_25" ];
  latest = builtins.elemAt versions (builtins.length versions - 1);
in
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs."go_${latest}"
    ];

    home.shellAliases = builtins.listToAttrs (
      map (version: let
        cmd = "nix-shell -p go_${version}";
      in {
        name = "go${version}";
        value = cmd;
      })
      versions
    );
  };
}