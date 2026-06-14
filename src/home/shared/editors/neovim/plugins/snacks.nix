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
          { section = "startup"; }
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
    };
  };
}
