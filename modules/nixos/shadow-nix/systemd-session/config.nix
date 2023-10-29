{ config, pkgs, lib, ... }:

{
  options.programs.shadow-client.systemd-session = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = ''
        Provides an autonomous systemd session for Shadow.
      '';
    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "myself";
      description = ''
        Select the user with which the session is started
      '';
    };

    tty = lib.mkOption {
      type = lib.types.int;
      default = 8;
      example = 1;
      description = ''
        Select the TTY where to start the systemd session
      '';
    };

    onClosingTty = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      example = 1;
      description = ''
        Select the TTY to switch to when exiting
      '';
    };
  };
}
