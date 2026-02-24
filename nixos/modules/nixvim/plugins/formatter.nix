{ ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings.format_on_save = {
      lspFallback = true;
      timeoutMs = 500;
    };
    settings.formatters_by_ft = {
      javascript = [ "prettier" ];
      python = [ "black" ];
      nix = [ "nixfmt" ];
    };
  };
}
