{ ... }:
{
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

      ".config/net.imput.helium"
      ".config/spotify"
      ".config/bruno"
      ".config/discord"
      ".config/steam"
      ".config/godot"

      ".cache/nix"
      ".cache/spotify"

      ".cargo"
      ".rustup"
      ".ssh"
      ".minecraft"
      ".tlauncher"
      ".steam"
      ".pi"
      "go"
    ];
  };
}
