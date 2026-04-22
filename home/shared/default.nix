{ ... }:
{
  imports = [
    ./shell/fish.nix
    ./shell/starship.nix
    ./shell/foot.nix
    ./editors/neovim
    ./programs/direnv.nix
    ./programs/fuzzel.nix
    ./programs/git.nix
    ./programs/yazi.nix
    ./programs/cli/btop.nix
    ./programs/cli/eza.nix
    ./programs/cli/fzf.nix
    ./programs/cli/zoxide.nix
    ./programs/cli/packages.nix
  ];
}
