{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    baseIndex = 1;
    escapeTime = 0;
    terminal = "screen-256color";
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %
    '';
  };
}
