{ ... }:
{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "super-tab";
        snippets.preset = "luasnip";

        appearance = {
          use_nvim_cmp_as_default = true;
          nerd_font_variant = "mono";
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };

        completion.documentation.auto_show = true;
        completion.ghost_text.enabled = true;
      };
    };
  };
}
