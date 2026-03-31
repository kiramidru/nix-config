{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    #inputs.blender-bin.packages.${pkgs.stdenv.hostPlatform.system}.default
    godot_4
    inkscape
  ];
}
