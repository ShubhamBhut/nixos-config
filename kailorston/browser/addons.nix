{ ff-addons, buildFirefoxXpiAddon }:

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
  sidebery = buildFirefoxXpiAddon rec {
    pname = "sidebery";
    addonId = "{3c078156-979c-498b-8990-85f7987dd929}";
    version = "5.0.0b31";
    url =
      "https://github.com/mbnuqw/sidebery/releases/download/v${version}/sidebery-${version}.xpi";
    sha256 = "sha256-J7N1w7T421c0B/oZJjpJJ4AsL1YpqUYaAkJsY5IhI+Y=";
    meta = { };
  };
}
