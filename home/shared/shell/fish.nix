{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza --color=auto --icons";
      ll = "eza -la --icons --git";
      la = "eza -a --icons";
      lt = "eza --tree --icons --level=2";

      grep = "grep --color=auto";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      rebuild = "sudo nixos-rebuild switch --flake .";

      cat = "bat";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
      direnv hook fish | source
    '';
  };
}
