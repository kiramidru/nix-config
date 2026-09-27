{ pkgs, osConfig, ... }:
{
  programs.mcp = {
    enable = true;
    servers = {
      github = {
        command = "${pkgs.nodejs}/bin/npx";
        args = [
          "-y"
          "@modelcontextprotocol/server-github"
        ];
        env.GITHUB_PERSONAL_ACCESS_TOKEN.file = osConfig.age.secrets.github-token.path;
      };

      filesystem = {
        command = "${pkgs.nodejs}/bin/npx";
        args = [
          "-y"
          "@modelcontextprotocol/server-filesystem"
          "/home/kira/projects"
        ];
      };

      playwright = {
        command = "${pkgs.nodejs}/bin/npx";
        args = [
          "-y"
          "@playwright/mcp"
        ];
      };
    };
  };
}
