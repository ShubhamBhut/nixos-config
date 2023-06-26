{ inputs, firefox, ... }:
let
  inherit (inputs) legacy-fox;
in
(firefox.overrideDerivation (oldAttrs: {
  buildCommand = oldAttrs.buildCommand + "\n" + ''
    cat "${legacy-fox}/config.js" >> "$out/lib/firefox/mozilla.cfg"
    echo 'pref("general.config.sandbox_enabled", false);' >> "$out/lib/firefox/defaults/autoconfig.js"
    cp "${legacy-fox}/legacy.manifest" "$out/lib/firefox"
    cp -r "${legacy-fox}/legacy" "$out/lib/firefox"
  '';
}))
