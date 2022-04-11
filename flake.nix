{
  description = "Shadow Nix";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-21.11";
    };
    blade-shadow-beta = {
      url = "github:NicolasGuilloux/blade-shadow-beta/master";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, blade-shadow-beta }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs {
        system = "x86_64-linux";
      };
      import ./default.nix {
        inherit lib nixpkgs stdenv pkgs fetchurl blade-shadow-beta;
      };
  };
}
