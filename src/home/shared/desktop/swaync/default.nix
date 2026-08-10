{ ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      widgets = [
        "title"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
        };
      };
    };
  };
}
