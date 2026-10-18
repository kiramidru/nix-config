_: {
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        globalstatus = true;
        component_separators = "";
        section_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            separator = {
              left = "";
            };
            right_padding = 2;
          }
        ];
        lualine_b = [
          "filename"
          "branch"
        ];
        lualine_c = [ "%=" ];
        lualine_x = [ ];
        lualine_y = [
          "filetype"
          "progress"
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
            separator = {
              right = "";
            };
            left_padding = 2;
          }
        ];
      };
      inactive_sections = {
        lualine_a = [ "filename" ];
        lualine_b = [ ];
        lualine_c = [ ];
        lualine_x = [ ];
        lualine_y = [ ];
        lualine_z = [ "location" ];
      };
    };
  };
}
