{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackage = epkgs: [
      epkgs.nix-mode
      epkgs.mixfmt
    ];
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
}
