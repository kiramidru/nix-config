{ ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.blacklistedKernelModules = [
    "nouveau"
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
  ];

  hardware.graphics.enable = true;
  hardware.enableRedistributableFirmware = true;
}
