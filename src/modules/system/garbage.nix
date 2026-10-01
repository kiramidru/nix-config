{ config, ... }:
{
  nix.optimise.automatic = true;

  programs.nh = {
    enable = true;
    flake = "/home/${config.hostSpec.username}/nix-config";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d --keep 5";
    };
  };
}
