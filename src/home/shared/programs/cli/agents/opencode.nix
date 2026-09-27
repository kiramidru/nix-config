{ osConfig, ... }:
{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;

    settings = {
      autoupdate = false;
    };

    tui = {
      mouse = true;
      diff_style = "auto";

      scroll_acceleration = {
        enabled = true;
      };

      attention = {
        enabled = true;
        notifications = true;
      };
    };

    context = ''
      # NixOS Environment Development Rules

      I am developing projects on NixOS. While the code we write (Node, Rust, Python, etc.) is standard, you MUST adhere to the following rules regarding my operating system constraints:

      ## 1. No Standard Filesystem Hierarchy (FHS)
      - NEVER assume the existence of `/bin`, `/usr/bin`, `/lib`, or `/usr/lib`.
      - Always use `#!/usr/bin/env bash` or `#!/usr/bin/env node` for shebangs, NEVER `#!/bin/bash`.
      - If a build script hardcodes absolute paths to standard Linux utilities, instruct me to patch it or provide a Nix-native workaround.

      ## 2. Pre-compiled Binaries & C-Bindings
      - If a project dependency requires downloading a pre-compiled Linux binary (e.g., Prisma engines, Puppeteer/Playwright browsers, Python C-wheels, or raw `wget` binaries), WARN ME. These will fail on NixOS due to missing dynamic linkers (glibc).
      - Instead of raw binaries, instruct me to use the equivalent package from `nixpkgs` (e.g., `pkgs.playwright-driver`) or set the appropriate environment variables to point to Nix-provided binaries (e.g., `PRISMA_QUERY_ENGINE_BINARY`).

      ## 3. Toolchains & Version Managers
      - NEVER suggest using `nvm`, `pyenv`, `rvm`, `rustup`, or `asdf` to install languages.
      - Assume I manage my project toolchains using `devenv`.
      - If we are starting a new project or adding a major system dependency (like a database or compiler), suggest adding it to my `devenv.nix` instead of a global install.

      ## 4. Package Management
      - NEVER suggest `npm install -g`, `pip install --user`, or `cargo install` for global tools.
      - Local project installs (e.g., `npm install` inside a `package.json` project) are fine, but global CLI tools must be added to my Devenv configuration.
      - Prefer local project execution (e.g., `npx`, `pnpm exec`, `uv run`) over global commands.
    '';
  };

  programs.fish.interactiveShellInit = ''
    set -gx DEEPSEEK_API_KEY (cat ${osConfig.age.secrets.deepseek-key.path})
    set -gx HCNSEC_API_KEY (cat ${osConfig.age.secrets.hcnsec-key.path})
  '';
}
