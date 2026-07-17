{ pkgs, ... }:

{
  services.postgresql = {
    enable = false;

    package = pkgs.postgresql_18;

    extensions =
      ps: with ps; [
        postgis
      ];

    ensureDatabases = [
      "rxmed"
      "postgres"
    ];
    ensureUsers = [
      {
        name = "postgres";
        ensureDBOwnership = true;
        ensureClauses.login = true;
        ensureClauses.superuser = true;
      }
    ];

    authentication = pkgs.lib.mkOverride 10 ''
      #type  database  DBuser  origin-address  auth-method
      local  all       all                     trust
      # ipv4
      host   all       all     127.0.0.1/32    trust
      # ipv6
      host   all       all     ::1/128         trust
    '';
  };
}
