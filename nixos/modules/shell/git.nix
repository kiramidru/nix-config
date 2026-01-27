{ ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.name = "Kirubel Midru";
      user.email = "kirubelmidru@proton.me";
      init.defaultBranch = "main";
    };
  };
}
