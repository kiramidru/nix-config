{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fluidsynth
    qpwgraph
    qsynth
    soundfont-fluid
    vmpk
  ];
}
