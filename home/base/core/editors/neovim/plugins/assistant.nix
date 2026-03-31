{ pkgs, config, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.opencode-nvim
    ];

    opts.autoread = true;

    extraConfigLuaPre = ''
      local secret_path = "${config.age.secrets.github-token.path}"
      local f = io.open(secret_path, "r")
      if f then
        local token = f:read("*all"):gsub("%s+", "")
        f:close()
        vim.env.GITHUB_TOKEN = token
      end
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>ai";
        action = "<cmd>lua require('opencode').ask()<CR>";
        options = {
          silent = true;
          desc = "OpenCode Ask";
        };
      }
      {
        mode = "n";
        key = "<leader>at";
        action = "<cmd>lua require('opencode').toggle()<CR>";
        options = {
          silent = true;
          desc = "Toggle OpenCode Terminal";
        };
      }
    ];
  };
}
