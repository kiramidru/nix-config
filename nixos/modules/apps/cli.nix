{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    impala
    yazi
    zathura
  ];
}
