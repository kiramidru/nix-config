{ pkgs, ... }:
{
  programs.pi-coding-agent = {
    enable = true;

    extraPackages = with pkgs; [
      nodejs
      python3
    ];

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
        # Themes
        "npm:pi-compact-tools"
        "npm:@pi-kaush/pi-welcome-screen"

        # Extensions
        "npm:pi-mem"
        "npm:@juicesharp/rpiv-ask-user-question"
        "npm:@juicesharp/rpiv-todo"
        "npm:@narumitw/pi-usage"
        "npm:@termdraw/pi"
        "npm:pi-subagents"
        "npm:pi-web-access"

        # Providers
        "npm:pi-provider-kiro"

        # Skills
        {
          source = "git:github.com/anthropics/skills";
          skills = [
            "skills/frontend-design/SKILL.md"
            "skills/pdf/SKILL.md"
            "skills/pptx/SKILL.md"
            "skills/skill-creator/SKILL.md"
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
