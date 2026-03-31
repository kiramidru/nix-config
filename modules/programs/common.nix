{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tuigreet
    jq
    wlogout
    wlsunset
    lxqt.lxqt-policykit
    brightnessctl
    pulseaudio
  ];
}
