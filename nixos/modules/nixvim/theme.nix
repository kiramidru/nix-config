{ ... }:
{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;

      settings.styles = {
        comments = [ "italic" ];
        conditionals = [ "italic" ];
        loops = [ "bold" ];
        functions = [
          "italic"
          "bold"
        ];
      };
    };
  };
}
