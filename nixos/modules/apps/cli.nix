{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    fastfetch
    fzf
    ripgrep

    age
    chezmoi

    btop
    impala
    yazi
    zathura
  ];
}
