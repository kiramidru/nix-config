{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    impala
    opencode
    yazi
    zathura
  ];
}
