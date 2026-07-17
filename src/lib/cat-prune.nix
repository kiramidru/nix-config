{ lib }:
{
  catppuccinPrune =
    { src, ignoreList }:
    let
      allModules = import "${src}/modules/home-manager/all-modules.nix";

      filteredModules = lib.filter (
        m: !lib.any (suffix: lib.hasSuffix suffix (toString m)) ignoreList
      ) allModules;
    in
    { lib, pkgs, ... }:
    {
      imports = [
        (lib.modules.importApply "${src}/modules/global.nix" {
          catppuccinModules = filteredModules;
        })
      ];
      catppuccin.sources = lib.mkDefault src.packages.${pkgs.stdenv.hostPlatform.system};
    };
}
