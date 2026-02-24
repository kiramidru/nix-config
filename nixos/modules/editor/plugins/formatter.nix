{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      black
      gofumpt
      nixfmt-rfc-style
      nodePackages.prettier
      sqruff
    ];

    plugins.conform-nvim = {
      enable = true;
      settings.format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      settings.formatters_by_ft = {
        go = [ "gofumpt" ];
        javascript = [ "prettier" ];
        nix = [ "nixfmt" ];
        python = [ "black" ];
        sql = [ "sqruff" ];
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>gf";
        action = ''
          <cmd>lua require("conform").format({ async = true, lsp_fallback = true })<cr>
        '';
        options = {
          silent = true;
          desc = "Format buffer";
        };
      }
    ];
  };
}
