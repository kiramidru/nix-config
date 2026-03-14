{ pkgs, ... }:
{
  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      mesa
    ];
  };

  boot.blacklistedKernelModules = [
    "nouveau"
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
  ];

  hardware.enableRedistributableFirmware = true;
}
