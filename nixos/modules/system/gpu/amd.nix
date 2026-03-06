{ ... }:
{
  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };

  hardware.graphics.enable = true;
  hardware.enableRedistributableFirmware = true;
}
