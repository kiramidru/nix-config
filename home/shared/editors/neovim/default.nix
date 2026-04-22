{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./plugins
    ./keymaps.nix
    ./options.nix
    ./theme.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
