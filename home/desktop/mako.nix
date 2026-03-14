{ ... }:
{
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";
      width = 300;
      height = 100;
      margin = "10";
      padding = "10";
      border-size = 2;
      border-radius = 5;
      default-timeout = 5000;
      group-by = "none";
      layer = "top";
    };
  };
}
