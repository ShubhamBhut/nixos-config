{ pkgs, lib, ... }: {
  home.packages = [ pkgs.keepassxc ];
  xdg.configFile."keepassxc/keepassxc.ini".text = lib.generators.toINI { } {
    General.ConfigVersion = 2;
    Security = {
      LockDatabaseIdle = true;
      LockDatabaseIdleSeconds = 60;
    };
    Browser = {
      Enabled = true;
      SearchInAllDatabases = true;
    };
    GUI = {
      ApplicationTheme = "dark";
      MinimizeOnStartup = true;
      MinimizeOnClose = true;
      MinimizeToTray = true;
      ShowTrayIcon = true;
      TrayIconAppearance = "monochrome-light";
    };
    SSHAgent.Enabled = true;
  };
}
