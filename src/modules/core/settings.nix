{
  config,
  pkgs,
  ...
}:
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];

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

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  users.mutableUsers = false;
  users.users.root = {
    hashedPasswordFile = config.age.secrets.root-password.path;
  };

  users.users.${config.hostSpec.username} = {
    hashedPasswordFile = config.age.secrets.kira-password.path;
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
}
