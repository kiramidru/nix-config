{ inputs, ... }:
{
  imports = [
    inputs.playit-nix.nixosModules.default
  ];

  services.playit = {
    enable = true;
    secretPath = "/home/kira/.config/playit_gg/playit.toml";
  };
}
