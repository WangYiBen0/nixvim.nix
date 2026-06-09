{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;

      dashboard = {
        enabled = true;
        sections = [
          {
            section = "header";
            content = ''
              ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
              ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
              ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
              ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
              ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
              ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
            '';
          }
          {
            section = "keys";
            gap = 1;
            padding = 2;
          }
          {
            icon = " ";
            title = "最近文件";
            section = "recent_files";
            indent = 2;
            padding = 1;
          }
          {
            icon = " ";
            title = "项目";
            section = "projects";
            indent = 2;
            padding = 1;
          }
          # { section = "startup"; } # Note: unavailable as the plugin manager is not lazy.nvim
        ];

        preset = {
          keys = [
            {
              icon = " ";
              key = "f";
              desc = "查找文件";
              action = ":lua Snacks.dashboard.pick('files')";
            }
            {
              icon = " ";
              key = "n";
              desc = "新建文件";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "g";
              desc = "全局搜索";
              action = ":lua Snacks.dashboard.pick('live_grep')";
            }
            {
              icon = " ";
              key = "c";
              desc = "配置";
              action = ":lua Snacks.dashboard.pick('files', {cwd = '~/.config/nvim'})";
            }
            {
              icon = " ";
              key = "q";
              desc = "退出";
              action = ":qa";
            }
          ];
        };
      };

      explorer.enabled = true;
      image.enabled = true;
      input.enabled = true;

      notifier = {
        enabled = true;
        timeout = 3000;
      };

      picker.enabled = true;
      quickfile.enabled = true;
      scope.enabled = true;
      scratch.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = true;

      terminal = {
        enabled = true;
        # win = {
        #   keys = {
        #     # nav_h.__raw = ''"<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t"'';
        #     # nav_j.__raw = ''"<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t"'';
        #     # nav_k.__raw = ''"<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t"'';
        #     # nav_l.__raw = ''"<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t"'';
        #     hide_slash.__raw = ''"<C-/>", "hide", desc = "Hide Terminal", mode = "t"'';
        #     hide_underscore.__raw = ''"<c-_>", "hide", desc = "which_key_ignore", mode = "t"'';
        #   };
        # };
      };

      words = {
        enabled = true;
        debounce = 100;
      };
    };
  };
}
