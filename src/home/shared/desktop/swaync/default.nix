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

      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;

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
