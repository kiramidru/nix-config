{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    opencode
    goose-cli
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.agy
  ];
}
