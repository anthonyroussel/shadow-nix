{ pkgs, ... }:

pkgs.testers.runNixOSTest ({ lib, ... }: {
  name = "shadow-client";

  nodes.machine = { pkgs, ... }: {
    imports = [
      ./x11.nix
      ../../modules/nixos/shadow-nix
    ];

    # Provides the `vainfo` command
    environment.systemPackages = with pkgs; [ libva-utils ];

    # Hardware hybrid decoding
    # nixpkgs.config.packageOverrides = pkgs: {
    #   vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
    # };

    # Hardware drivers
    hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-media-driver
      ];
    };

    programs.shadow-client = {
      enable = true;
      channel = "prod";
    };
  };

  # enableOCR = true;

  testScript = ''
    machine.wait_for_x()

    machine.execute("shadow-prod >&2 &")
    # machine.wait_for_window("Shadow PC")
    # machine.wait_for_text(r"(New Game|Start Server|Load Game|Help Manual|Join Game|About|Play Online)")
    machine.sleep(10)
    machine.screenshot("screen")
  '';
})
