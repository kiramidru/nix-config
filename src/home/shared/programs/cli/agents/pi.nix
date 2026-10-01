{ pkgs, osConfig, ... }:
{
  programs.pi-coding-agent = {
    enable = true;

    extraPackages = with pkgs; [
      nodejs
      bun
      python3
    ];

    models = {
      providers = {
        deepseek = {
          api = "openai-completions";
          apiKey = "!cat ${osConfig.age.secrets.deepseek-key.path}";
          baseUrl = "https://api.deepseek.com";
          models = [
            {
              id = "deepSeek-flash";
              name = "DeepSeek V4.1 Flash";
              reasoning = true;
            }
          ];
        };

        hcnsec = {
          api = "openai-completions";
          apiKey = "!cat ${osConfig.age.secrets.hcnsec-key.path}";
          baseUrl = "https://api.hcnsec.cn/v1";
          models = [
            {
              id = "deepSeek-flash";
              name = "DeepSeek V4.1 Flash";
              reasoning = true;
            }
            {
              id = "deepSeek-v4-pro";
              name = "DeepSeek V4 Pro";
              reasoning = true;
            }
          ];
        };
      };
    };

    settings = {
      quietStartup = true;
      tuiMode = "fullscreen";
      fullscreenExitOutput = "resume-hint";

      compaction = {
        enabled = true;
        keepRecentTokens = 20000;
        reserveTokens = 16384;
      };

      packages = [
        # Theme
        "npm:pi-compact-tools"
        "npm:@pi-kaush/pi-welcome-screen"

        # Extensions
        "npm:pi-mem"
        "npm:pi-mcp-adapter"
        "npm:billion-context"
        "npm:@juicesharp/rpiv-ask-user-question"
        "npm:@juicesharp/rpiv-todo"
        "npm:@narumitw/pi-usage"
        "npm:@termdraw/pi"
        "npm:pi-verdict"
        "npm:pi-subagents"
        "npm:pi-web-access"

        # Skills
        "npm:bigpowers"
        "npm:@dietrichgebert/ponytail"
        {
          source = "git:github.com/anthropics/skills";
          skills = [
            "skills/frontend-design/SKILL.md"
            "skills/pdf/SKILL.md"
            "skills/pptx/SKILL.md"
          ];
        }
        {
          source = "git:github.com/emilkowalski/skills";
          skills = [
            "skills/emil-design-eng/SKILL.md"
            "skills/animate/SKILL.md"
          ];
        }
      ];

      retry = {
        enabled = true;
        maxRetries = 3;
      };
    };
  };
}
