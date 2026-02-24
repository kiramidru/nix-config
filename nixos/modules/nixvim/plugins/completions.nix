{ ... }:
{
  programs.nixvim.plugins = {
    # 1. Enable the completion engine and basic sources
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        # The bordered() window style
        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };

        # The sources = { ... } block
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];

        # The mapping = { ... } block
        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };
      };

      # The cmp.setup.cmdline block
      cmdline = {
        "/" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [ { name = "buffer"; } ];
        };
        "?" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [ { name = "buffer"; } ];
        };
      };
    };
  };

  # This replaces the cmp.event:on("confirm_done", ...) block
  # It links nvim-autopairs to cmp automatically.
  programs.nixvim.plugins.nvim-autopairs.settings.checkTs = true;
}
