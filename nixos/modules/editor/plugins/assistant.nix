{ ... }:
{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        suggestion.enabled = false;
        panel.enabled = false;
      };
    };

    plugins.avante = {
      enable = true;
      settings = {
        provider = "copilot";
        providers = {
          copilot = {
            model = "gpt-4o";
          };
        };
      };
    };
  };
}
