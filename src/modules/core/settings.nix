{ config
, pkgs
, ...
}:
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  nix = {
    extraOptions = ''
      !include ${config.age.secrets.github-token.path}
    '';

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
      trusted-users = [
        "root"
        "kira"
      ];
    };
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
