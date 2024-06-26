# Update instructions:
#
# To update `thunderbird-bin`'s `release_sources.nix`, run from the nixpkgs root:
#
#     nix-shell maintainers/scripts/update.nix --argstr package pkgs.thunderbird-bin-unwrapped
{ lib, stdenv, fetchurl, config, wrapGAppsHook
, alsa-lib
, atk
, cairo
, curl
, cups
, dbus-glib
, dbus
, fontconfig
, freetype
, gdk-pixbuf
, glib
, glibc
, gtk2
, gtk3
, libkrb5
, libX11
, libXScrnSaver
, libxcb
, libXcomposite
, libXcursor
, libXdamage
, libXext
, libXfixes
, libXi
, libXinerama
, libXrender
, libXrandr
, libXt
, libXtst
, libcanberra
, libnotify
, libGLU, libGL
, nspr
, nss_latest
, pango
, pipewire
, pciutils
, heimdal
, libpulseaudio
, systemd
, writeScript
, writeText
, xidel
, coreutils
, gnused
, gnugrep
, gnupg
, ffmpeg
, runtimeShell
, mesa # thunderbird wants gbm for drm+dmabuf
, systemLocale ? config.i18n.defaultLocale or "en_US"
}:

let
  version = "118.0a1";
  mozillaPlatforms = {
    i686-linux = "linux-i686";
    x86_64-linux = "linux-x86_64";
  };

  policies = { DisableAppUpdate = true; } // config.thunderbird.policies or { };
  policiesJson = writeText "thunderbird-policies.json" (builtins.toJSON { inherit policies; });

in

stdenv.mkDerivation {
  pname = "thunderbird-bin";
  inherit version;

  src = fetchurl {
    url = "https://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-central/thunderbird-120.0a1.en-US.linux-x86_64.tar.bz2";
    sha256 = "sha256-4X7PGjrcjTz689pyPl4+VV+4q8Kiw+Ys0aQxfMehC78=";
  };

  libPath = lib.makeLibraryPath
    [ stdenv.cc.cc
      alsa-lib
      atk
      cairo
      curl
      cups
      dbus-glib
      dbus
      fontconfig
      freetype
      gdk-pixbuf
      glib
      glibc
      gtk2
      gtk3
      libkrb5
      mesa
      libX11
      libXScrnSaver
      libXcomposite
      libXcursor
      libxcb
      libXdamage
      libXext
      libXfixes
      libXi
      libXinerama
      libXrender
      libXrandr
      libXt
      libXtst
      libcanberra
      libnotify
      libGLU libGL
      nspr
      nss_latest
      pango
      pipewire
      pciutils
      heimdal
      libpulseaudio
      systemd
      ffmpeg
    ] + ":" + lib.makeSearchPathOutput "lib" "lib64" [
      stdenv.cc.cc
    ];

  inherit gtk3;

  nativeBuildInputs = [ wrapGAppsHook ];

  buildInputs = [ gtk3 ];

  # "strip" after "patchelf" may break binaries.
  # See: https://github.com/NixOS/patchelf/issues/10
  dontStrip = true;
  dontPatchELF = true;

  patchPhase = ''
    # Don't download updates from Mozilla directly
    echo 'pref("app.update.auto", "false");' >> defaults/pref/channel-prefs.js
  '';

  # See "Note on GPG support" in `../thunderbird/default.nix` for explanations
  # on adding `gnupg` and `gpgme` into PATH/LD_LIBRARY_PATH.
  installPhase =
    ''
      mkdir -p "$prefix/usr/lib/thunderbird-bin-${version}"
      cp -r * "$prefix/usr/lib/thunderbird-bin-${version}"

      mkdir -p "$out/bin"
      ln -s "$prefix/usr/lib/thunderbird-bin-${version}/thunderbird" "$out/bin/"

      for executable in \
        thunderbird thunderbird-bin plugin-container \
        updater crashreporter webapprt-stub \
        glxtest vaapitest
      do
        if [ -e "$out/usr/lib/thunderbird-bin-${version}/$executable" ]; then
          patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
            "$out/usr/lib/thunderbird-bin-${version}/$executable"
        fi
      done

      find . -executable -type f -exec \
        patchelf --set-rpath "$libPath" \
          "$out/usr/lib/thunderbird-bin-${version}/{}" \;

      # wrapThunderbird expects "$out/lib" instead of "$out/usr/lib"
      ln -s "$out/usr/lib" "$out/lib"

      gappsWrapperArgs+=(--argv0 "$out/bin/.thunderbird-wrapped")

      # See: https://github.com/mozilla/policy-templates/blob/master/README.md
      mkdir -p "$out/lib/thunderbird-bin-${version}/distribution";
      ln -s ${policiesJson} "$out/lib/thunderbird-bin-${version}/distribution/policies.json";
    '';

  passthru.updateScript = import ./../../browsers/firefox-bin/update.nix {
    inherit lib writeScript xidel coreutils gnused gnugrep curl gnupg runtimeShell;
    pname = "thunderbird-bin";
    baseName = "thunderbird";
    channel = "release";
    basePath = "pkgs/applications/networking/mailreaders/thunderbird-bin";
    baseUrl = "http://archive.mozilla.org/pub/thunderbird/releases/";
  };

  passthru = {
    binaryName = "thunderbird";
  };

  meta = with lib; {
    changelog = "https://www.thunderbird.net/en-US/thunderbird/${version}/releasenotes/";
    description = "Mozilla Thunderbird, a full-featured email client (binary package)";
    homepage = "http://www.mozilla.org/thunderbird/";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.mpl20;
    maintainers = with lib.maintainers; [ lovesegfault ];
    platforms = builtins.attrNames mozillaPlatforms;
    hydraPlatforms = [ ];
  };
}
