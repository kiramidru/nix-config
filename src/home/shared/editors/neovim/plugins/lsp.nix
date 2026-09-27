_: {
  programs.nixvim = {
    diagnostic = {
      settings = {
        severity_sort = true;
        underline = true;
        update_in_insert = false;
        virtual_text = {
          spacing = 4;
          prefix = "●";
        };
      };
    };

    dependencies.go.packageFallback = true;
    plugins.lsp = {
      enable = true;

      keymaps = {
        diagnostic = {
          "[d" = "goto_prev";
          "]d" = "goto_next";
          "<leader>e" = "open_float";
        };
        lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "gI" = "implementation";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
        };
      };

      servers = {
        nixd = {
          enable = true;
          settings = {
            nix = {
              flake = {
                autoArchive = true;
              };
            };
            formatting.command = [ "nixpkgs-fmt" ];
          };
        };

        basedpyright = {
          enable = true;
          package = null;
        };
        ruff = {
          enable = true;
          package = null;
        };
        gleam = {
          enable = true;
          package = null;
        };
        vtsls = {
          enable = true;
          package = null;
        };

        gopls = {
          enable = true;
          package = null;
          settings = {
            gofumpt = true;
            staticcheck = true;
            usePlaceholders = true;
            analyses = {
              unusedparams = true;
              nilness = true;
              shadow = true;
            };
          };
        };

        rust_analyzer = {
          enable = true;
          package = null;
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

    plugins.fidget = {
      enable = true;
      settings = {
        progress = {
          display = {
            done_icon = "✓";
          };
        };
      };
    };
  };
}
