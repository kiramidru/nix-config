{ ... }:
{
  services.system76-scheduler = {
    enable = true;
    useStockConfig = false;

    settings.processScheduler.useExecsnoop = false;
  };
}
