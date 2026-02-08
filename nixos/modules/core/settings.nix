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

  users.users.${config.hostSpec.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "seat"
      "adbusers"
      "kvm"
    ];
    shell = pkgs.fish;
  };
  nixpkgs.config.allowUnfree = true;
  networking.hostName = lib.mkDefault config.hostSpec.hostName;
}
