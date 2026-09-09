{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        filesystem = {
          filtered_items = {
            visible = true;
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>Neotree toggle reveal<cr>";
        options = {
          silent = true;
          desc = "Toggle Neo-tree";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree focus<cr>";
        options = {
          silent = true;
          desc = "Focus Neo-tree";
        };
      }
    ];
  };
}
