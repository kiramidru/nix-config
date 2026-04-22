{
  config,
  pkgs,
  inputs,
  ...
}:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    warn-dirty = false;
    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  age.secrets."${config.hostSpec.username}-password".file =
    inputs.self + "/secrets/${config.hostSpec.username}-password.age";

  users.users.${config.hostSpec.username} = {
    hashedPasswordFile = config.age.secrets."${config.hostSpec.username}-password".path;
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
}
