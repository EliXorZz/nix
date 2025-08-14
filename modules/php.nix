{ inputs, config, pkgs, username, ... }:

let
  phps = [ "php81" "php82" "php83" "php84" ];
  extensions = [ "redis" ];
in
{
  home-manager.users.${username} = {
    home.shellAliases = builtins.listToAttrs (
      map (php: let
        cmd = "nix-shell -p '${php}.withExtensions ({ all, enabled }: enabled ++ (with all; [ ${builtins.concatStringsSep " " extensions} ]))' ${php}Packages.composer";
      in {
        name = php;
        value = cmd;
      })
      phps
    );
  };
}