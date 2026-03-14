{ ... }:
{
  services.system76-scheduler = {
    enable = true;
    useStockConfig = true;
  };

  services.irqbalance.enable = true;
}
