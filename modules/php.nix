{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      pkgs.php81
      pkgs.php82
      pkgs.php83
      pkgs.php84
    ];
  };
}