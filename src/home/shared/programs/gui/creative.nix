{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.warehouse-nix.packages.${pkgs.stdenv.hostPlatform.system}.blender
    gimp
    godot_4
    inkscape
    krita
    davinci-resolve
  ];
}
