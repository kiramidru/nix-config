{ ... }:
{
  programs.nixvim = {
    opts.termguicolors = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavor = "mocha";
        transparent_background = true;
      };
    };
  };
}
