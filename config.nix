{ config, pkgs, lib, ... }:

{
  options.programs.shadow-client = {
    enable = lib.mkEnableOption ''
      Enable the client to the Shadow Gaming Cloud Computer on NixOS
    '';

    channel = lib.mkOption {
      type = lib.types.enum [ "prod" "preprod" "testing" ];
      default = "prod";
      example = "preprod";
      description = ''
        Choose a channel for the Shadow application.
        `prod` is the stable channel,
        `pre-prod` is the beta channel,
        `testing` is the alpha channel.
      '';
    };

    extraChannels = lib.mkOption {
      type = lib.types.listOf (lib.types.enum [ "prod" "preprod" "testing" ]);
      default = [ ];
      example = [ "preprod" "testing" ];
      description = ''
        Choose extra channels to install aside from the main channel
      '';
    };

    launchArgs = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "--report";
      description = ''
        Start the launcher with arguments by default
      '';
    };

    enableDesktopLauncher = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = ''
        Provides the desktop file for launching Shadow from current session (only works with Xorg sessions).
      '';
    };

    enableDiagnostics = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = ''
        The command used to execute the client will be output in a file in /tmp.
        The client will output its strace in /tmp.
        This is mainly used for diagnostics purposes (when an update breaks something).
      '';
    };

    forceDriver = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum [ "iHD" "i965" "radeon" "radeonsi" ]);
      default = null;
      example = "iHD";
      description = ''
        Force the VA driver used by Shadow using the LIBVA_DRIVER_NAME environment variable.
      '';
    };

    enableGpuFix = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = ''
        Disable the GPU fixes for Shadow related to the color bit size.
      '';
    };
  };
}
