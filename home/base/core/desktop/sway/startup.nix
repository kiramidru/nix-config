{ ... }:
{
  wayland.windowManager.sway.config.startup = [
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
