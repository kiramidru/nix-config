# nix-config

Personal NixOS and Home Manager configuration using Flakes, Impermanence, Disko, and Stylix.

## Architecture

- **Host**: `monolith` (AMD laptop, x86_64-linux)
- **Init & Root**: Systemd-boot, initrd systemd with Btrfs root reset on boot (`@` subvolume wiped; `/persist` mounted with `neededForBoot`).
- **Filesystem**: Disko-managed GPT Btrfs partitioning (`/boot` ESP, `@` root, `@nix`, `@persist`, `@log`, `@swap`).
- **Compositor & Session**: SwayFX managed via UWSM and launched through greetd (tuigreet).
- **Theming**: Stylix with Rose Pine dark theme across Sway, Waybar, SwayNC, Foot, Neovim, and GTK.
- **Secrets**: Agenix with decryption identity at `/persist/etc/ssh/ssh_host_ed25519_key`.
- **Shell & Tools**: Fish, Foot, Starship, Yazi, Btop, Eza, Fzf, Devenv, Nixvim.

## Key Paths & Persistence

State is reset on every reboot except for explicitly persisted locations under `/persist`:
- System: `/var/lib/nixos`, `/var/lib/iwd`, `/var/lib/bluetooth`, `/etc/machine-id`, `/etc/ssh`
- User: `~/projects`, `~/nix-config`, `~/.ssh`, `~/.gnupg`, `~/.librewolf`, `~/.local/state/nvim`, `~/.local/share/opencode`, `~/.config/opencode`

## Rebuilding

```bash
# Rebuild and switch (nh os switch)
rebuild
# or using nix directly:
nixos-rebuild switch --flake .#monolith
```

## Maintenance & Checks

```bash
# Evaluate flake outputs and configurations
nix flake check --offline --no-build

# Check formatting across all Nix files
nixfmt --check $(git ls-files '*.nix')
```
