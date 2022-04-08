let
  # Import package
  pkgs = import <nixpkgs> { };

  # Call package for the channel
  package = channel: pkgs.callPackage ../default.nix {
    channel = channel;
    enableDiagnostics = true;
    enableDesktopLauncher = true;
  };

in pkgs.mkShell {
  buildInputs = [
    (package "prod")
    (package "preprod")
    (package "testing")
  ];
}
