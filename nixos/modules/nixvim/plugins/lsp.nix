{ ... }:
{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      diagnostics = {
        underline = true;
        updateInInsert = false;
        severitySort = true;
        virtualText = {
          prefix = "●";
          spacing = 4;
        };
      };

      keymaps.lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gr" = "implementation";
        "<leader>ca" = "code_action";
      };

      servers = {
        gopls.enable = true;
        lua-ls.enable = true;
        nil-ls.enable = true;
        pyright.enable = true;
        tailwindcss.enable = true;
        ts-ls.enable = true;
        jsonls.enable = true;

        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          settings = {
            cargo.allFeatures = true;
            checkOnSave = {
              enable = true;
              command = "clippy";
            };
            procMacro.enable = true;
          };
        };
      };
    };
  };
}
