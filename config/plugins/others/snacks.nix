{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile = {
        enabled = true;
      };

      notifier = {
        enabled = true;
        timeout = 3000;
      };

      quickfile = {
        enabled = true;
      };

      statuscolumn = {
        enabled = true;
      };

      words = {
        debounce = 100;
        enabled = true;
      };

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

      explorer = {
        enabled = true;
      };

      image = {
        enabled = true;
      };

      input = {
        enabled = true;
      };

      picker = {
        enabled = true;
      };

      scope = {
        enabled = true;
      };

      scroll = {
        enabled = true;
      };

      scratch = {
        enabled = true;
      };
    };
  };
}
