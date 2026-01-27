nix.distributedBuilds = true;
nix.buildMachines = [ {
  hostName = "meskoso";
  system = "x86_64-linux";
  maxJobs = 16;
  supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
} ];
