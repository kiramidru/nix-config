{ ... }:
{
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };
      battery = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };

  services.irqbalance.enable = true;
  services.system76-scheduler = {
    enable = true;
    useStockConfig = true;
  };
}
