{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];

    shellAliases = {
      ls = "eza --color=auto --icons";
      ll = "eza -la --icons --git";
      la = "eza -a --icons";
      lt = "eza --tree --icons --level=2";

      grep = "grep --color=auto";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      rebuild = "sudo SSH_AUTH_SOCK=\$SSH_AUTH_SOCK nixos-rebuild switch --flake .";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
}
