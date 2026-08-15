{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [
          "mode"
          {
            __unkeyed-1.__raw = ''
              function()
                return "REC ●"
              end
            '';
            cond.__raw = ''function() return vim.fn.reg_recording() ~= "" end'';
            color = {
              fg = "#eed49f";
            };
          }
        ];
      };
    };
  };
}
