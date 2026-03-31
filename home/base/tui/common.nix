{ pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      update_ms = 1000;
    };
  };

  home.packages = with pkgs; [
    bat
    bluetui
    fastfetch
    fd
    impala
    ouch
    ripgrep
    sioyek
    grim
    playerctl
    opencode
  ];
}
