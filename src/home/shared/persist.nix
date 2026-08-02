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

      ".cargo"
      ".rustup"
      "go"

      ".local/share/fish"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/nvim"
      ".local/share/TelegramDesktop"
      ".local/share/opencode"

      ".config/net.imput.helium"
      ".config/spotify"
      ".config/opencode"

      ".cache/spotify"

      ".ssh"
    ];
  };
}
