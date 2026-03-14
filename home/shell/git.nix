{ config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kira";
        email = "kiramidru@email.com";
      };

      credential.helper = "!f() { echo \"password=$(cat ${config.age.secrets.github-token.path})\"; }; f";

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
      };

      init = {
        defaultBranch = "main";
      };

      pull.rebase = true;
    };
  };
}
