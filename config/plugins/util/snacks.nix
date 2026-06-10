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

  keymaps = [
    {
      key = "<leader>n";
      action.__raw = ''
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end
      '';
      options.desc = "Notification History";
    }
    {
      key = "<leader>un";
      action.__raw = "function() Snacks.notifier.hide() end";
      options.desc = "Dismiss All Notifications";
    }
    {
      mode = "n";
      key = "<leader>.";
      action.__raw = "function() Snacks.scratch() end";
      options.desc = "Toggle Scratchpad";
    }
    {
      mode = "n";
      key = "<leader>S";
      action.__raw = "function() Snacks.scratch.select() end";
      options.desc = "Select Scratchpad";
    }
    {
      mode = "n";
      key = "<leader>dps";
      action.__raw = "function() Snacks.profiler.scratch() end";
      options.desc = "Profiler Scratch Buffer";
    }

    # Floating terminal
    {
      mode = "n";
      key = "<leader>ft";
      action.__raw = "function() Snacks.terminal() end";
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = "n";
      key = "<C-/>";
      action.__raw = "function() Snacks.terminal() end";
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = "t";
      key = "<C-/>";
      action = "<cmd>close<cr>";
      options.desc = "Hide Terminal";
    }

    # --- Search ---
    {
      mode = "n";
      key = "<leader><space>";
      action.__raw = "function() Snacks.picker.smart() end";
      options.desc = "Smart Find Files";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action.__raw = "function() Snacks.picker.recent() end";
      options.desc = "Recent Files";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = "function() Snacks.picker.buffers() end";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>sg";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Grep (Global Search)";
    }
    {
      mode = "n";
      key = "<leader>sw";
      action.__raw = "function() Snacks.picker.grep_word() end";
      options.desc = "Search Word Under Cursor";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options.desc = "Search Keymaps";
    }
    {
      mode = "n";
      key = "<leader>sq";
      action.__raw = "function() Snacks.picker.qflist() end";
      options.desc = "Quickfix List";
    }
  ];
}
