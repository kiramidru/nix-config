{ pkgs, ... }:
{
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  environment.variables.EDITOR = "nvim";

  environment.systemPackages = with pkgs; [
    # Lua
    lua-language-server
    stylua

    # Nix
    nil
    nixfmt

    #JSON
    jq
  ];
}
