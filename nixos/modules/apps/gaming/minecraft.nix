{ pkgs, ... }:

let
  legacy-launcher-fhs = pkgs.buildFHSEnv {
    name = "legacy-launcher";
    targetPkgs =
      pkgs: with pkgs; [
        openjdk21
        libGL
        libpulseaudio
        xorg.libX11
        xorg.libXext
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libuuid
        libglvnd
        mesa
        udev
        vulkan-loader
        zlib
      ];
runScript = pkgs.writeShellScript "launch-tl" ''
      export GDK_BACKEND=x11
      export _JAVA_AWT_WM_NONREPARENTING=1
      
      export LD_LIBRARY_PATH=/run/opengl-driver/lib:/run/opengl-driver-32/lib:$LD_LIBRARY_PATH
      
      export mesa_glthread=true
      export GALLIUM_DRIVER=radeonsi 

      exec java -Xmx4G -Xms2G -Djava.awt.headless=false -jar /home/kira/nix-config/nixos/LegacyLauncher.jar
    '';
  };

  legacy-launcher-desktop = pkgs.makeDesktopItem {
    name = "legacy-launcher";
    desktopName = "Legacy Launcher";
    exec = "legacy-launcher";
    icon = "minecraft";
    categories = [ "Game" ];
  };
in
{
  environment.systemPackages = [
    legacy-launcher-fhs
    legacy-launcher-desktop
  ];
}
