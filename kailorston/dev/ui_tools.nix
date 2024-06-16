{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    libsForQt5.full.out
    dioxus-cli
    libsoup_3
    webkitgtk
    gtk3
    pango
    cairo
    libsoup
    atk
    gdk-pixbuf
    wasm-pack
  ];

}
