{ pkgs, osConfig, ... }:
{
  programs.pi-coding-agent = {
    enable = true;

    extraPackages = with pkgs; [
      nodejs
    ];

    models = {
      providers = {
        deepseek = {
          api = "openai-completions";
          apiKey = "$DEEPSEEK_KEY";
          baseUrl = "https://api.deepseek.com";
          models = [
            {
              id = "deepseek-flash";
              name = "DeepSeek V4.1 Flash";
              contextWindow = 1000000;
              maxTokens = 384000;
              input = [ "text" "image" ];
              reasoning = true;
              compat = {
                requiresReasoningContentOnAssistantMessages = true;
                thinkingFormat = "deepseek";
                supportsReasoningEffort = true;
                maxTokensField = "max_tokens";
                reasoningEffortMap = {
                  minimal = "low";
                  low = "low";
                  medium = "high";
                  high = "xhigh";
                  xhigh = "max";
                };
              };
            }
          ];
        };

        hcnsec = {
          api = "openai-completions";
          apiKey = "$HCNSEC_KEY";
          baseUrl = "https://api.hcnsec.cn/v1";
          models = [
            {
              id = "DeepSeek-V4-Flash";
              name = "DeepSeek V4 Flash";
              reasoning = true;
            }
            {
              id = "DeepSeek-V4-Pro";
              name = "DeepSeek V4 Pro";
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
        "npm:@alexanderfortin/pi-deepseek-usage"
      ];

      retry = {
        enabled = true;
        maxRetries = 3;
      };
    };
  };

  home.file.".pi/agent/mcp.json".text = builtins.toJSON {
    mcpServers = {
      context7 = {
        command = "npx";
        args = [
          "-y"
          "@upstash/context7-mcp"
        ];
        lifecycle = "keep-alive";
      };
      playwright = {
        command = "npx";
        args = [
          "-y"
          "@playwright/mcp@latest"
          "--headless"
        ];
        lifecycle = "keep-alive";
      };
      agentage-memory = {
        command = "npx";
        args = [
          "-y"
          "@agentage/server-memory"
        ];
        lifecycle = "keep-alive";
      };
      github = {
        command = "npx";
        args = [
          "-y"
          "@modelcontextprotocol/server-github"
        ];
        env = {
          GITHUB_PERSONAL_ACCESS_TOKEN = "$GITHUB_TOKEN";
        };
        lifecycle = "keep-alive";
      };
      token-optimizer = {
        command = "npx";
        args = [
          "-y"
          "@ooples/token-optimizer-mcp"
          "run"
        ];
        env = {
          MAX_FILE_LINES = "300";
          ENABLE_TOKEN_TRACKING = "true";
        };
        lifecycle = "keep-alive";
      };
    };
  };

  programs.fish.interactiveShellInit = ''
    set -gx DEEPSEEK_KEY (cat ${osConfig.age.secrets.deepseek-key.path})
    set -gx HCNSEC_KEY (cat ${osConfig.age.secrets.hcnsec-key.path})
    set -gx GITHUB_TOKEN (cat ${osConfig.age.secrets.github-token.path})
  '';
}
