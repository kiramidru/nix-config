_: {
  home.persistence."/persist" = {
    directories = [
      "nix-config"
      "projects"

      "Downloads"
      "Documents"
      "Games"
      "Music"
      "Pictures"

      ".local/share/devenv"
      ".local/share/fish"
      ".local/share/keyrings"
      ".local/share/nvim"
      ".local/share/TelegramDesktop"
      ".local/share/bruno"
      ".local/share/Steam"
      ".local/share/godot"
      ".local/share/trilium-data"
      ".local/share/qBittorrent"
      ".local/share/direnv"
      ".local/state/wireplumber"

      ".config/net.imput.helium"
      ".config/spotify"
      ".config/bruno"
      ".config/discord"
      ".config/steam"
      ".config/godot"
      ".config/obsidian"
      ".config/Slack"
      ".config/qBittorrent"

      ".cache/nix"
      ".cache/spotify"

      {
        directory = ".gnupg";
        mode = "0700";
      }
      ".cargo"
      ".rustup"
      ".ssh"
      ".thunderbird"
      ".zoom"
      ".pi"
      ".minecraft"
      ".tlauncher"
      ".steam"
      "go"
    ];
  };
}
