{ ... }:
{
  programs.nixvim.plugins.lsp = {
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
      nixd = {
        enable = true;
        settings = {
          nix = {
            flake = {
              # This fixes the "flake inputs not available" warning
              autoArchive = true;
            };
          };
          formatting.command = [ "nixpkgs-fmt" ];
          # This helps with NixOS option completion
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
}
