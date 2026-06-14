{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.stardew-valley
  ];
}
