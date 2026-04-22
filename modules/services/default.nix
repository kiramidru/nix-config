{ ... }:
{
  imports = [
    ./maintenance
    ./memory
    ./networking
    ./sync
    ./virtualization
    ./dbus.nix
    ./ollama.nix
  ];
}
