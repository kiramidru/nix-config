{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./plugins
    ./theme.nix
    ./keymaps.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
