{ ... }:
{
  programs.nixvim.plugins.gitsigns = {
    enable = true;

    # The setup() configuration
    settings = {
      signs = {
        add = {
          text = "┃";
        };
        change = {
          text = "┃";
        };
        delete = {
          text = "_";
        };
        topdelete = {
          text = "‾";
        };
        changedelete = {
          text = "~";
        };
        untracked = {
          text = "┆";
        };
      };

      # This enables the "current line" git blame you see in many IDEs
      current_line_blame = true;
    };
  };
}
