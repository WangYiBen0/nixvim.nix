{
  plugins.which-key = {
    enable = true;
    settings = {
      win.border = "rounded";
      delay = 200;
      layout = {
        align = "right";
        # spacing = 3;
      };
      preset = "modern";
      icons = {
        breadcrumb = "»";
        separator = "➜";
        group = "+";
      };
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "buffer";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "code";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "file/find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "quit/session";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "search";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "ui";
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "window";
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "diagnostics/quickfix";
        }
      ];
    };
  };
}
