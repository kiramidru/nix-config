{ inputs, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = [ pkgs.nixfmt ];
  };
}
