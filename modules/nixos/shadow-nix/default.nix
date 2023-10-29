{ config, pkgs, lib, ... }:

let
  # Client configuration
  cfg = config.programs.shadow-client;

  # Declare the package with the appropriate configuration
  # shadow-package = channel: pkgs.callPackage ../default.nix {
  shadow-package = channel: pkgs.callPackage ../../../packages/shadow-nix/default.nix {
    channel = channel;
    enableDiagnostics = cfg.enableDiagnostics;
    enableDesktopLauncher = cfg.enableDesktopLauncher;
  };

in {
  # Import the configuration
  #  ./x-session ./systemd-session
  imports = [ ../../config.nix ];

  # By default, if you import this file, the Shadow app will be installed
  programs.shadow-client.enable = lib.mkDefault true;

  # Enables
  environment = lib.mkIf cfg.enable {
    # Install Shadow wrapper
    systemPackages = with pkgs; [
      (shadow-package cfg.channel)
      libva-utils
      libva
    ] ++ lib.forEach cfg.extraChannels shadow-package;

    # Add GPU fixes
    etc.drirc.source = lib.mkIf (cfg.enableGpuFix) ../../.drirc;

    # Force VA Driver
    variables.LIBVA_DRIVER_NAME = lib.mkIf (cfg.forceDriver != null) [ cfg.forceDriver ];
  };
}
