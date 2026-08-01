{ inputs, pkgs, ... }:
{
  home.packages = [
    # inputs.gaming-nix.packages.${pkgs.stdenv.hostPlatform.system}.broforce
  ];
}
