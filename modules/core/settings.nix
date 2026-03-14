{
  config,
  lib,
  pkgs,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  age.secrets."${config.hostSpec.username}-password".file =
    ../../secrets/${config.hostSpec.username}-password.age;

  users.users.${config.hostSpec.username} = {
    hashedPasswordFile = config.age.secrets."${config.hostSpec.username}-password".path;

    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "seat"
      "video"
      "audio"
      "input"
      "render"
      "docker"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault config.hostSpec.hostName;
}
