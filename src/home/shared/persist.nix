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
      ".local/share/bruno"

      ".config/net.imput.helium"
      ".config/spotify"
      ".config/opencode"
      ".config/emacs"
      ".config/bruno"

      ".cache/spotify"

      ".ssh"
    ];
  };
}
