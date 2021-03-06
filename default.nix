{ stdenv, lib, pkgs, fetchurl

# Native build inputs
, autoPatchelfHook, wrapGAppsHook, makeWrapper

# Build inputs
, zlib, xorg, alsaLib, libbsd, libopus, openssl, libva, pango, cairo, libuuid, nspr
, nss, cups, expat, atk, at-spi2-atk, gtk3, gdk-pixbuf, libsecret, systemd
, pulseaudio, libGL, dbus, libnghttp2, libidn2, libpsl, libkrb5, openldap
, rtmpdump, libinput, mesa, libpulseaudio, libvdpau, curl

# Which distribution channel to use.
, channel ? "prod"

# Whether to enable debug mode.
, enableDiagnostics ? false

# Which additional parameters to pass to the Shadow executable.
, extraClientParameters ? []

# Whether to provide the desktop file to launch Shadow.
, enableDesktopLauncher ? true
}:

with lib;

let
  # Import tools
  utilities = (import ./utilities { inherit lib pkgs; });

  # Latest release information
  upstream-info = (lib.importJSON ./upstream-info.json).${channel};

in stdenv.mkDerivation rec {
  pname = "shadow-${channel}";
  version = upstream-info.version;
  src = fetchurl {
    url = "https://update.shadow.tech/launcher/${channel}/linux/ubuntu_18.04/${upstream-info.path}";
    hash = "sha512-${upstream-info.sha512}";
  };
  binaryName = (if channel == "prod" then "shadow" else "shadow-${channel}");

  # Add all hooks
  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook
    makeWrapper
  ];

  # Useful libraries to build the package
  buildInputs = [
    stdenv.cc.cc.lib

    xorg.libX11
    xorg.libxcb
    xorg.libXrandr
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXScrnSaver
    xorg.libXcursor
    xorg.libXfixes
    xorg.libXi
    xorg.libXtst
    xorg.xcbutilimage
    xorg.xcbutilrenderutil
    xorg.libxshmfence

    cairo
    pango
    alsaLib
    libbsd
    libopus
    libinput
    openssl
    libva
    zlib
    libuuid
    nspr
    nss
    cups
    expat
    atk
    at-spi2-atk
    gtk3
    gdk-pixbuf
    libnghttp2
    libidn2
    libpsl
    libkrb5
    openldap
    rtmpdump
    mesa
    libpulseaudio
    libvdpau
    curl
  ];

  # Mandatory libraries for the runtime
  runtimeDependencies = [
    stdenv.cc.cc.lib
    systemd
    libinput
    pulseaudio
    libGL
    dbus
    libsecret
    xorg.libXinerama
    libva
  ];

  # Unpack the AppImage
  unpackPhase = ''
    cp $src ./Shadow.AppImage
    chmod 777 ./Shadow.AppImage

    patchelf \
      --set-interpreter ${stdenv.cc.bintools.dynamicLinker} \
      --replace-needed libz.so.1 ${zlib}/lib/libz.so.1 \
      ./Shadow.AppImage

    ./Shadow.AppImage --appimage-extract
    rm ./Shadow.AppImage
  '';

  # Create the package
  installPhase =
    ''
      mkdir -p $out/opt
      mkdir -p $out/lib

      mv ./squashfs-root/usr/share $out/
      mkdir -p $out/share/applications

      ln -s ${lib.getLib systemd}/lib/libudev.so.1 $out/lib/libudev.so.1
      rm -r ./squashfs-root/usr/lib
      rm ./squashfs-root/AppRun
      mv ./squashfs-root $out/opt/shadow-${channel}
    '' +

    # Add debug wrapper
    optionalString enableDiagnostics (utilities.debug.wrapRenderer channel) +

    # Wrap renderer
    ''
      wrapProgram $out/opt/shadow-${channel}/resources/app.asar.unpacked/release/native/Shadow \
        --run "cd $out/opt/shadow-${channel}/resources/app.asar.unpacked/release/native/" \
        --prefix LD_LIBRARY_PATH : "$out/opt/shadow-${channel}" \
        --prefix LD_LIBRARY_PATH : "$out/lib" \
        --prefix LD_LIBRARY_PATH : ${makeLibraryPath runtimeDependencies} \
        --add-flags "--no-usb" \
        --add-flags "--agent \"Linux;x64;Chrome 80.0.3987.165;latest\"" \
        ${concatMapStrings (x: " --add-flags '" + x + "'") extraClientParameters}
    ''

    # Wrap Renderer into binary
    + ''
      makeWrapper \
        $out/opt/shadow-${channel}/resources/app.asar.unpacked/release/native/Shadow \
        $out/bin/shadow-${channel}-renderer \
        --prefix LD_LIBRARY_PATH : ${makeLibraryPath runtimeDependencies}
    ''

    # Wrap launcher
    + ''
      makeWrapper $out/opt/shadow-${channel}/${binaryName} $out/bin/shadow-${channel} \
        --prefix LD_LIBRARY_PATH : ${makeLibraryPath runtimeDependencies}
    ''

    # Add Desktop entry
    + optionalString enableDesktopLauncher ''
      substitute $out/opt/shadow-${channel}/${binaryName}.desktop \
        $out/share/applications/${binaryName}.desktop \
        --replace "Exec=AppRun" "Exec=$out/bin/shadow-${channel}" \
        --replace "Icon=${binaryName}" "Icon=$out/opt/shadow-${channel}/resources/app.asar.unpacked/release/main/assets/icons/${channel}/${binaryName}.png"
    '';

  meta = with lib; {
    description = "Client for the Shadow Cloud Gaming Computer";
    homepage = "https://shadow.tech";
    license = [ licenses.unfree ];
    platforms = platforms.linux;
  };
}
