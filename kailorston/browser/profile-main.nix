{ pkgs, ff-addons }:
{
  # isDefault = true;
  userChrome = builtins.readFile ./userChrome.css;
  search = {
    default = "DuckDuckGo";
    engines = {
      "Bing".metaData.hidden = true;
      "Google".metaData.alias = "g";
      "DuckDuckGo".metaData.alias = "ddg";

      "discord.py" = let version = "latest"; in {
        urls = [{
          template = "https://discordpy.readthedocs.io/en/${version}/search.html?q={searchTerms}";
        }];
        definedAliases = [ "dpy" ];
      };

      "Library Genesis" = {
        urls = [
          { template = "https://libgen.rs/search.php?req={searchTerms}"; } # non-fiction
          { template = "https://libgen.rs/fiction/?q={searchTerms}"; } # fiction
          { template = "https://libgen.rs/scimag/?q={searchTerms}"; } # scientific articles
          { template = "https://magzdb.org/makelist?t={searchTerms}"; } # magazines
        ];
        definedAliases = [ "libgen" ];
      };

      "Nix Packages" = {
        urls = [{
          template = "https://search.nixos.org/packages";
          params = [
            { name = "channel"; value = "unstable"; }
            { name = "query"; value = "{searchTerms}"; }
            { name = "type"; value = "packages"; }
          ];
        }];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "np" ];
      };

      "NixOS Wiki" = {
        urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
        iconUpdateURL = "https://nixos.wiki/favicon.png";
        updateInterval = 24 * 60 * 60 * 1000; # every day
        definedAliases = [ "nw" ];
      };

      "Source Graph" = {
        urls = [{
          template = "https://sourcegraph.com/search";
          params = [
            { name = "q"; value = "context:@maan2003/nix {searchTerms}"; }
            { name = "groupBy"; value = "repo"; }
          ];
        }];
        definedAliases = [ "sg" ];
      };
    };
    force = true;
    order = [
      "DuckDuckGo"
      "Google"
    ];
  };

  extensions = with ff-addons; [
    stylus
    ublock-origin
    vimfx
  ];

  settings = {
    # Dark mode
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # user chrome
    "sidebar.position_start" = true; # sidebar on left side
    "browser.uidensity" = 1; # compact mode
    "svg.context-properties.content.enabled" = true; # sideberry icons
    "layout.css.prefers-color-scheme.content-override" = 0;
    "layout.css.scroll-behavior.spring-constant" = "250";

    "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
    "browser.startup.page" = 3; # restore
    "distribution.searchplugins.defaultLocale" = "en-GB";
    "drm" = true;
    "general.useragent.locale" = "en-GB";
  };
}
