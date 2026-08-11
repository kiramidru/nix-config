{ pkgs, ... }:
{
  programs.opencode = {
    enable = true;

    extraPackages = with pkgs; [
      tree-sitter
      nodejs
      ripgrep
    ];

    settings = {
      permission = {
        read = "allow";
        edit = "allow";
        bash = "ask";
        websearch = "allow";
      };

      mcp = {
        ast-codebase = {
          type = "local";
          enabled = true;
          command = "${pkgs.nodejs}/bin/npx";
          args = [
            "-y"
            "cocoindex-code"
            "serve"
          ];
        };
      };
    };
  };
}
