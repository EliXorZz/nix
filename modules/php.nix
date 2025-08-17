{ inputs, config, pkgs, username, ... }:

let
  versions = [ "81" "82" "83" "84" ];
  extensions = [ "redis" ];
  
  latest = builtins.elemAt versions (builtins.length versions - 1);
in
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      (pkgs."php${latest}".withExtensions (phpPackages:
        let
          exts = map (ext: phpPackages.all.${ext}) extensions;
        in
          phpPackages.enabled ++ exts
      ))
      (pkgs."php${latest}Packages".composer)
    ];

    home.shellAliases = builtins.listToAttrs (
      map (version: let
        cmd = "nix-shell -p 'php${version}.withExtensions ({ all, enabled }: enabled ++ (with all; [ ${builtins.concatStringsSep " " extensions} ]))' php${version}Packages.composer";
      in {
        name = "php${version}";
        value = cmd;
      })
      versions
    );
  };
}