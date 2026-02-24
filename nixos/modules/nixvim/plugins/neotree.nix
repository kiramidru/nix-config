{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      filesystem = {
        filteredItems = {
          visible = true;
          hideDotfiles = false;
          hideGitignored = true;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = ":Neotree filesystem reveal left<CR>";
        options = {
          silent = true;
          desc = "Toggle Neo-tree";
        };
      }
    ];
  };
}
