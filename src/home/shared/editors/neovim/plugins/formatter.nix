{ ... }:
{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 500;
        };
        formatters_by_ft = {
          go = [ "gofumpt" ];
          javascript = [ "prettier" ];
          nix = [ "nixpkgs_fmt" ];
          python = [ "ruff_format" ];
          sql = [ "sqruff" ];
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>gf";
        action = ''
          <cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<cr>
        '';
        options = {
          silent = true;
          desc = "Format buffer";
        };
      }
    ];
  };
}
