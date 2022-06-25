{ pkgs, ... }:

let
  repository = /home/runner/work/shadow-nix/shadow-nix;
in {
  imports = [
    (repository + "/import/home-manager.nix")
  ];
  home = {
    username = "shadow";
    homeDirectory = "/home/shadow";
    stateVersion = "21.11";
  };
}
