{ pkgs, ... }:

let
  repository = /home/runner/work/shadow-nix/shadow-nix;
in {
  imports = [
    (repository + "/import/home-manager.nix")
  ];
  home = {
    username = "runner";
    homeDirectory = "/home/runner";
    stateVersion = "23.05";
  };
}
