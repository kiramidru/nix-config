{ ... }:
{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
          { section = "recent_files"; }
        ];
      };
      bigfile = {
        enabled = true;
      };
      quickfile = {
        enabled = true;
      };
      statuscolumn = {
        enabled = true;
      };
      words = {
        enabled = true;
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>un";
          action = "<cmd>lua Snacks.notifier.hide()<CR>";
          options.desc = "Dismiss notifications";
        }
        {
          mode = "n";
          key = "<leader>nh";
          action = "<cmd>lua Snacks.notifier.show_history()<CR>";
          options.desc = "Notification history";
        }
      ];
    };
  };
}
