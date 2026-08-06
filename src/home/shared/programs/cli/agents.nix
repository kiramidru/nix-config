{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    opencode
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.agy
  ];
}
