{ lib, ... }:

{
  options.hostSpec = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "username of the user";
    };
    hostName = lib.mkOption {
      type = lib.types.str;
      description = "hostname of the machine";
    };

    role = lib.mkOption {
      type = lib.types.enum [
        "workstation"
        "laptop"
        "server"
      ];
      default = "laptop";
      description = "role of the machine";
    };
  };
}
