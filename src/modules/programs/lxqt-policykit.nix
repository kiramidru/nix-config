{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.lxqt.lxqt-policykit ];
}
