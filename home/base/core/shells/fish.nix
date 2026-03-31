{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      rebuild = "sudo nixos-rebuild switch --flake . --impure";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
      direnv hook fish | source
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
