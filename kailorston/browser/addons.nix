{ inputs, pkgs }:

let
  ff-addons = inputs.ff-addons.packages.${pkgs.system};
  inherit (inputs.ff-addons.lib.${pkgs.system}) buildFirefoxXpiAddon;
in
ff-addons // {
  vimfx = buildFirefoxXpiAddon rec {
    pname = "vimfx";
    addonId = "VimFx-unlisted@akhodakivskiy.github.com";
    version = "0.26.4";
    url =
      "https://github.com/akhodakivskiy/VimFx/releases/download/v${version}/VimFx.xpi";
    sha256 = "sha256-8uVuk/oqOY6zE640GQ7nzBLGcxLvCHToqPLjuxdS428=";
    meta = { };
  };
}
