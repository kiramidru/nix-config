{ ... }: {
  imports = [ ];

  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "var/lib/nixos"
        "var/lib/systemd/coredump"
        "var/lib/iwd"
        "var/lib/tailscale"

        {
          directory = "etc/ssh";
          how = "bindmount";
        }
      ];

      files = [
        "etc/machine-id"
      ];

      users.kira = {
        directories = [
          "nix-config"
          "projects"
          "Downloads"
          "Documents"
          "Games"
          "Music"
          "Pictures"

          ".cargo"
          ".rustup"

          ".local/share/fish"
          ".local/share/keyrings"
          ".local/share/direnv"
          ".local/share/nvim"

          ".config/net.imput.helium"

          {
            directory = ".ssh";
            how = "bindmount";
          }
        ];
      };
    };
  };

  systemd.services.systemd-machine-id-commit.enable = false;
  fileSystems."/persist".neededForBoot = true;
}
