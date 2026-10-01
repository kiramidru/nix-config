{ config, ... }:
{
  services.restic.backups.remote-backup = {
    initialize = true;
    repository = "b2:kira-restic-bucket";

    passwordFile = config.age.secrets.restic-password.path;
    environmentFile = config.age.secrets.backblaze-bucket.path;

    paths = [
      "/persist/home/${config.hostSpec.username}/Documents"
    ];

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 4"
      "--keep-monthly 12"
    ];

    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
