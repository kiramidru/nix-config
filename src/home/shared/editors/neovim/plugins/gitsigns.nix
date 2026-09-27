_: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;

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

        current_line_blame = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "]h";
        action = "<cmd>Gitsigns next_hunk<CR>";
        options.desc = "Next Git hunk";
      }
      {
        mode = "n";
        key = "[h";
        action = "<cmd>Gitsigns prev_hunk<CR>";
        options.desc = "Previous Git hunk";
      }
      {
        mode = "n";
        key = "<leader>ph";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options.desc = "Preview Git hunk inline";
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = "<cmd>Gitsigns stage_hunk<CR>";
        options.desc = "Stage Git hunk";
      }
      {
        mode = "n";
        key = "<leader>rh";
        action = "<cmd>Gitsigns reset_hunk<CR>";
        options.desc = "Reset Git hunk";
      }
    ];

  };
}
