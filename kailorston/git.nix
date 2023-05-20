{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "ShubhamBhut";
    userEmail = "shubhamprecious1@gmail.com";
  };
  home.packages = [ pkgs.github-cli ];
}
