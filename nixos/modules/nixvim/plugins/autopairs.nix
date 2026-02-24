{ ... }:
{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;

    # Optional: If you want autopairs to play nice with nvim-cmp
    # (so it adds brackets after you select a function from the completion menu)
    settings = {
      checkTs = true; # Use treesitter to check for pairs
    };
  };
}
