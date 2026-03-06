{ ... }:
{
  imports = [
    ./gpu/amd.nix
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./documentation.nix
    ./firmware.nix
    ./garbage.nix
    ./kernel.nix
    ./locale.nix
    ./memory.nix
    ./networking.nix
    # ./power.nix
  ];
}
