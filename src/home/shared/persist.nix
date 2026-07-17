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

      ".local/share/fish"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/nvim"
      ".config/net.imput.helium"

      ".ssh"
    ];
  };
}
