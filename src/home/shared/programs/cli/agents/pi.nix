{ pkgs, osConfig, ... }: {
  programs.pi-coding-agent = {
    enable = true;

    extraPackages = with pkgs; [
      nodejs
      bun
    ];

    models = {
      providers = {
        deepseek = {
          api = "openai-completions";
          apiKey = "$DEEPSEEK_KEY";
          baseUrl = "https://api.deepseek.com";
          models = [
            {
              id = "deepseek-chat";
              name = "DeepSeek V4 Pro";
              reasoning = true;
            }
          ];
        };
        openrouter = {
          api = "openai-completions";
          apiKey = "$OPENROUTER_API_KEY";
          baseUrl = "https://openrouter.ai/api/v1";
          models = [
            {
              id = "nvidia/nemotron-3-ultra-550b-a55b:free";
              name = "Nvidia Nemotron 3 Ultra (Free)";
              reasoning = true;
            }
          ];
        };
      };
    };

    settings = {
      compaction = {
        enabled = true;
        keepRecentTokens = 20000;
        reserveTokens = 16384;
      };

      packages = [
        "npm:@termdraw/pi"
        "npm:pi-mcp-adapter"
      ];

      retry = {
        enabled = true;
        maxRetries = 3;
      };
    };
  };

  programs.fish.interactiveShellInit = ''
    set -gx DEEPSEEK_KEY (cat ${osConfig.age.secrets.deepseek-key.path})
    set -gx OPENROUTER_API_KEY (cat ${osConfig.age.secrets.openrouter-key.path})
  '';
}
