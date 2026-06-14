{ src, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    src.home.shared.editors.neovim.keymaps
    src.home.shared.editors.neovim.options
    src.home.shared.editors.neovim.theme
  ]
  ++ (builtins.attrValues src.home.shared.editors.neovim.plugins);

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
