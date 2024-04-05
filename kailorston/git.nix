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
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user.name = "ShubhamBhut";
    user.email = "shubhamprecious1@gmail.com";
    ui.diff.tool = [ "difft" "--color=always" "$left" "$right" ];
    revsets.short-prefixes = "latest(trunk() | trunk().., 50)";
    ui.pager = "less -FRX";
    aliases.l = [ "log" "-r" "(trunk()..@):: | (trunk()..@)-" ];
    aliases.f = [ "git" "fetch" ];
    aliases.p = [ "git" "push" ];
    aliases.pa = [ "git" "push" "-r" "branches() & ~conflict()"];
    aliases.lost = [
      "log"
      "-r"
      "mine() & trunk().."
    ];
    aliases.ra = [
      "rebase"
      "-s"
      "all:roots(trunk()..(latest(::trunk(), 100):: & branches())) & immutable_heads().."
      "-d"
      "trunk()"
      "--skip-empty"
    ];
    template-aliases = {
      "format_short_change_id(id)" = "id.shortest()";
      "format_timestamp(timestamp)" = "timestamp.ago()";
      "format_short_signature(signature)" = "if(signature.name(), label(\"username\", signature.name().substr(0, 5).lower()), email_placeholder)";
      "builtin_log_compact" = ''
        if(root,
          builtin_log_root(change_id, commit_id),
          label(if(current_working_copy, "working_copy"),
            separate(" ",
              builtin_change_id_with_hidden_and_divergent_info,
              branches,
              tags,
              working_copies,
              if(conflict, label("conflict", "❌")),
              if(empty, label("empty", "(empty)")),
              if(description, description.first_line(), description_placeholder),
              format_short_signature(author),
            ) ++ "\n",
          )
        )
      '';
    };
  };
}
