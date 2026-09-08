{ ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "kiramidru";
        email = "99871382+kiramidru@users.noreply.github.com";
      };

      init = {
        defaultBranch = "main";
      };

      pull.rebase = true;

      url = {
        "git@github.com:" = {
          pushInsteadOf = "https://github.com/";
        };
      };
    };
  };
}
