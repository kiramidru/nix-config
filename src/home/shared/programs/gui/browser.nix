_: {
  programs.librewolf = {
    enable = true;

    profiles.default = {
      isDefault = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "network.cookie.lifetimePolicy" = 0;
        "browser.startup.page" = 3;
        "browser.sessionstore.resume_from_crash" = true;
        "browser.sessionstore.max_resumed_crashes" = -1;
      };
    };
  };
}
