{ ... }:
{
  wayland.windowManager.sway.config.startup = [
    {
      command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway; systemctl --user stop pipewire xdg-desktop-portal xdg-desktop-portal-wlr; systemctl --user start pipewire xdg-desktop-portal xdg-desktop-portal-wlr";
    }

    { command = "foot --server"; }

    {
      command = "eww daemon";
      always = true;
    }
    {
      command = "eww open bar";
      always = true;
    }
    {
      command = "eww open notch";
      always = true;
    }
  ];
}
