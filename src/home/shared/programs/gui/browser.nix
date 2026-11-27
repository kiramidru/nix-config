{ ... }: {
  programs.librewolf = {
    enable = true;

    profiles.default = {
      isDefault = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;

        # Keep cookies, site data, and sessions on shutdown
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "network.cookie.lifetimePolicy" = 0;

        # Keep session logins across restarts (0 = store data for all sites including HTTPS)
        "browser.sessionstore.privacy_level" = 0;
        "browser.startup.page" = 3;
        "browser.sessionstore.resume_from_crash" = true;
        "browser.sessionstore.max_resumed_crashes" = -1;
      };
    };
  };
}
