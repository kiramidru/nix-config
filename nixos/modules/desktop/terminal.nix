{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    fastfetch
    fzf
    ripgrep

    age
    chezmoi

    fishPlugins.hydro
    fishPlugins.sponge
  ];
  programs.fish = {
    enable = true;
    vendor.completions.enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
      set -g hydro_symbol_prompt "❯"
      set -g hydro_color_pwd cyan
      set -g hydro_color_git magenta
      set -g hydro_color_error red
      set -g hydro_fetch false

      set -g fish_prompt_pwd_dir_length 100

      direnv hook fish | source
    '';
  };
  programs.tmux.enable = true;
  programs.foot.enable = true;
}
