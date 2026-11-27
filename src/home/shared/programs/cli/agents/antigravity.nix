{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.antigravity-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
