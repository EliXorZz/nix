{ config, pkgs, username, ... }:

{
  services.aerospace = {
    enable = true;
    settings = {
      start-at-login = true;
    };
  }; 
}