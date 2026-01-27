{ ... }:
{
  documentation = {
    enable = false;
    man.enable = false;
    dev.enable = false;
    doc.enable = false;
    nixos.enable = false;
    man.generateCaches = false;
  };

  nixpkgs.config.extraOptions = {
    installDoc = false;
  };
}
