{ config, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "eza -la";
      lt = "eza --tree --level=2";

      grep = "grep --color=auto";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      rebuild = "nh os switch ${config.home.homeDirectory}/nix-config";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
}
