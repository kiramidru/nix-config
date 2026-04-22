{ ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "kiramidru";
        email = "kiramidru@proton.me";
      };

      credential.helper = "!f() { echo \"username=kiramidru\"; echo \"password=$(cat $XDG_RUNTIME_DIR/agenix/github-token)\"; }; f";

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
