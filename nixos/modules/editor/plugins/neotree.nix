{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        filesystem = {
          filtered_items = {
            hide_gitignored = true;
            hide_dotfiles = false;
            visible = true;
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>Neotree reveal left<cr>";
        options = {
          silent = true;
          desc = "Toggle Neo-tree";
        };
      }
    ];
  };
}
