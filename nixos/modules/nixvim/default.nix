{ ... }:
{
  imports = [
    ./keymaps.nix
    ./options.nix
    ./theme.nix
    /plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
