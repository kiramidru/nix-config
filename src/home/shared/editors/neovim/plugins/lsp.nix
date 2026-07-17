{ ... }:
{
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

    plugins.lsp = {
      enable = true;

      keymaps.lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gr" = "implementation";
        "<leader>ca" = "code_action";
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
            options = {
              nixos.expr = ''(builtins.getFlake "/etc/nixos").nixosConfigurations.Kira.options'';
            };
          };
        };

        gopls.enable = true;
        pyright.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;
        jsonls.enable = true;

        rust_analyzer = {
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
