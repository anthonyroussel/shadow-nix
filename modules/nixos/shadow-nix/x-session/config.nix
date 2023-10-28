{ config, pkgs, lib, ... }:

{
  options.programs.shadow-client.x-session = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = ''
        Provides a XSession desktop file for Shadow Launcher.
        Useful if you want to autostart it without any DE/WM.
      '';
    };

    additionalMenuEntries = lib.mkOption {
      default = { };
      example = ''{ "myProgram" = "myProgramCommand"; }'';
      description = ''
        Sets the content of the menu provided in the Openbox bundled standalone session.
      '';
    };

    startScript = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "tint2 &";
      description = ''
        Custom script executed before shadow is launched in the Openbox bundled standalone session.
      '';
    };
  };
}
