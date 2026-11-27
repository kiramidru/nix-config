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
      ".local/state/nvim"
      ".local/share/opencode"
      ".local/share/TelegramDesktop"
      ".local/share/bruno"
      ".local/share/godot"
      ".local/share/qBittorrent"
      ".local/share/direnv"
      ".local/state/wireplumber"

      ".config/blender"
      ".config/spotify"
      ".config/bruno"
      ".config/discord"
      ".config/godot"
      ".config/heroic"
      ".config/obsidian"
      ".config/opencode"
      ".config/Slack"
      ".config/qBittorrent"
      ".config/antigravity"

      ".cache/nix"
      ".cache/spotify"
      ".cache/blender"

      {
        directory = ".gnupg";
        mode = "0700";
      }
      ".gemini"
      ".cargo"
      ".rustup"
      ".ssh"
      ".thunderbird"
      ".librewolf"
      ".zoom"
      ".pi"
      ".minecraft"
      ".tlauncher"
      "go"

      # Steam
      ".local/share/Steam"
      ".local/share/vulkan"
      ".cache/mesa_shader_cache"
      ".cache/nvidia"
      ".steam"
    ];
  };
}
