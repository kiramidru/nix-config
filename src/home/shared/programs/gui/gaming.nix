{ inputs, pkgs, ... }:
{
  home.packages = with inputs.gaming-nix.packages.${pkgs.stdenv.hostPlatform.system}; [
    # crawl
    cuphead
    minecraft-launcher
    # libreaim
  ];
}
