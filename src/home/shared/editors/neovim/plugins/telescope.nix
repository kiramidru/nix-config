_: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        ui-select = {
          enable = true;
          settings = {
            theme = "dropdown";
          };
        };

        fzf-native.enable = true;
      };

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Telescope Find Files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Telescope Live Grep";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Telescope Buffers";
        };
        "<leader>git" = {
          action = "git_files";
          options.desc = "Telescope Git Files";
        };
      };
    };
  };
}
