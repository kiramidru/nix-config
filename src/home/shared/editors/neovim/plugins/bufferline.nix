_: {
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;

      settings = {
        options = {
          numbers = "ordinal";

          close_command = "bdelete! %d";
          right_mouse_command = "bdelete! %d";
        };
      };
    };
  };
}
