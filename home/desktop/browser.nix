{ pkgs, ... }:
{
  home.packages = with pkgs; [
    google-chrome
  ];

  programs.librewolf = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      Preferences = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.bookmarks" = false;
        "privacy.clearOnShutdown.downloads" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "privacy.resistFingerprinting.autoDeclineNoRefererRequests" = false;
        "privacy.sanitize.sanitizeOnShutdown" = true;

        "cookiebanners.service.mode.privateBrowsing" = 2;
        "cookiebanners.service.mode" = 2;
        "privacy.donottrackheader.enabled" = true;

        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
      };

      ExtensionSettings = {
        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
