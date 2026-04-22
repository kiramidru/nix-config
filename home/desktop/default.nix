{ ... }:
{
  imports = [
    # Window manager
    ./sway

    # Desktop components
    ./eww
    ./font.nix
    ./notifications.nix

    # Applications
    ./apps/browsers/google-chrome.nix
    ./apps/browsers/librewolf.nix
    ./apps/creative.nix
    ./apps/devtools.nix
    ./apps/media.nix
    ./apps/productivity.nix
    ./apps/spicetify.nix
  ];
}
