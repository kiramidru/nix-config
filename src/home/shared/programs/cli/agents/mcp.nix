{ pkgs, ... }:
{
  programs.mcp = {
    enable = true;
    servers = {
      godot = {
        command = "${pkgs.nodejs}/bin/npx";
        args = [
          "-y"
          "godot-mcp-cli"
        ];
        environment = {
          MCP_TRANSPORT = "stdio";
        };
      };
    };
  };
}
