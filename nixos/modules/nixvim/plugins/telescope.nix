{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions.ui-select = {
        enable = true;
        settings = {
          theme = "dropdown";
        };
      };

      extensions.fzf-native.enable = true;

      keymaps = {
        "<C-p>" = {
          action = "find_files";
          options.desc = "Telescope Find Files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Telescope Live Grep";
        };
      };
    };
  };
}
