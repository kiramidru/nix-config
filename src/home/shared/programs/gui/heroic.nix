{ pkgs, ... }:
{

  home.packages = [
    (pkgs.heroic.override {
      extraPkgs =
        pkgs': with pkgs'; [
          gamemode
          gamescope
        ];
    })
  ];
}
