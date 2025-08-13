{ inputs, config, pkgs, username, ... }:

{
  homebrew = {
    taps = ["mhaeuser/mhaeuser"];
    casks = ["battery-toolkit"];
  }
}