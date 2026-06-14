{ ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixGrammars = true;
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
        indent.enable = true;
      };
    };

    rainbow-delimiters.enable = true;
    indent-blankline.enable = true;
  };
}
