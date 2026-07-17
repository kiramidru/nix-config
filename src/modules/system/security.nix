{ pkgs, ... }:

{
  security.polkit.enable = true;
  services.gnome = {
    gnome-keyring.enable = true;
    gcr-ssh-agent.enable = false;
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "default.target" ];
    wants = [ "default.target" ];
    after = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  environment.systemPackages = with pkgs; [
    ragenix
  ];
}
