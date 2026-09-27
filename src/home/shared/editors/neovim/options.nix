_: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };
    opts = {
      expandtab = true;
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      number = true;
      relativenumber = true;

      undofile = true;
      signcolumn = "yes";
    };

    plugins.web-devicons.enable = true;
  };
}
