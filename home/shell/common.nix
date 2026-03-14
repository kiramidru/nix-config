{ pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      update_ms = 1000;
    };
  };

  home.packages = with pkgs; [
    bluetui
    ripgrep
    fd
    impala

    fastfetch
    manix
    impala
    ouch
    sioyek
    yazi
  ];
}
