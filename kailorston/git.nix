{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "ShubhamBhut";
    userEmail = "shubhamprecious1@gmail.com";
  
  # signing
    extraConfig = {
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_ed25519.pub";
      commit.gpgsign = true;
    };
    };
  home.packages = [ pkgs.github-cli ];
}
