{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.blender
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.stardew-valley
    godot_4
    inkscape
    libresprite
  ];
}
