{ inputs, pkgs, ... }:
{
  home.packages = with inputs.gaming-nix.packages.${pkgs.stdenv.hostPlatform.system}; [
    minecraft
    gris
    tmnt-shredders-revenge
  ];
}
