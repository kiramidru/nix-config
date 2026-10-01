{ pkgs, config, ... }:
{
  programs.mcp = {
    enable = true;
    servers = {
      filesystem = {
        command = "${pkgs.nodejs}/bin/npx";
        args = [
          "-y"
          "@modelcontextprotocol/server-filesystem"
          "${config.home.homeDirectory}/projects"
        ];
      };

      playwright = {
        command = "${pkgs.nodejs}/bin/npx";
        args = [
          "-y"
          "@playwright/mcp"
          "--headless"
          "--executable-path"
          "${pkgs.chromium}/bin/chromium"
        ];
      };
    };
  };
}
