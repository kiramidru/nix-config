{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      rebuild = "sudo nixos-rebuild switch --flake . --impure";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""

      # Hydro prompt settings
      set -g hydro_symbol_prompt "❯"
      set -g hydro_color_pwd cyan
      set -g hydro_color_git magenta
      set -g hydro_color_error red
      set -g hydro_fetch false
      set -g fish_prompt_pwd_dir_length 100
    '';
  };
}
