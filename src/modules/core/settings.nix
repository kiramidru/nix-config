{ config
, pkgs
, ...
}:
{
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
      trusted-users = [ "root" ];
      extra-substituters = [ "https://devenv.cachix.org" ];
      extra-trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = config.age.secrets.root-password.path;
      };

      ${config.hostSpec.username} = {
        hashedPasswordFile = config.age.secrets.user-password.path;
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "video"
        ];

        shell = pkgs.fish;
      };
    };
  };

  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
}
