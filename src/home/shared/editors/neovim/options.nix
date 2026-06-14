{
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
    };

    plugins.web-devicons.enable = true;
  };
}
