{
  description = "Supporting Shadow Gaming under NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];


      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          shadow-prod = pkgs.callPackage ./packages/shadow-nix {
            channel = "prod";
            enableDiagnostics = true;
            enableDesktopLauncher = true;
          };

          shadow-preprod = pkgs.callPackage ./packages/shadow-nix {
            channel = "preprod";
            enableDiagnostics = true;
            enableDesktopLauncher = true;
          };

          shadow-testing = pkgs.callPackage ./packages/shadow-nix {
            channel = "testing";
            enableDiagnostics = true;
            enableDesktopLauncher = true;
          };
        };

        checks = {
          nixosTests-shadow-client = pkgs.callPackage  ./checks/nixosTests/shadow-client.nix {};
        };
      };

      flake = {
        hmModules = {
          shadow-client = ./modules/hm/shadow-nix;
        };

        nixosModules = {
          shadow-client = ./modules/nixos/shadow-nix;
        };
      };
    };

}
