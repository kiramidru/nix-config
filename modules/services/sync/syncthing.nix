{ config, ... }:

let
  username = config.hostSpec.username;
in
{
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}";
    configDir = "/home/${username}/.config/syncthing";
    openDefaultPorts = true;

    settings = {
      options = {
        urAccepted = -1; # Disable usage reporting
      };
    };
  };
}
