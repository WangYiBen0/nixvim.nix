{
  plugins.snacks = {
    enable = true;
    settings = {
      # animinate.enabled = false;
      bigfile.enabled = true;
      # bufdelete.enabled = false;

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

      # debug.enabled = false;
      # dim.enabled = false;
      explorer.enabled = true;
      # gh.enabled = false;
      # git.enabled = false;
      # gitbrowse.enabled = false;
      image.enabled = true;
      indent.enabled = true;
      input.enabled = true;
      # keymaps.enabled = false;
      # layout.enabled =false;
      # lazygit.enabled=false;

      notifier = {
        enabled = true;
        timeout = 3000;
      };

      # notify.enabled = false;
      picker.enabled = true;
      # profiler.enabled = false;
      quickfile.enabled = true;
      scope.enabled = true;
      scratch.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = true;
      terminal.enabled = true;
      toggle.enabled = true;
      # util.enabled = false;
      # win.enabled = false;

      words = {
        enabled = true;
        debounce = 100;
      };

      # zen.enabled = false;
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

    # File explorer (Snacks)
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "function() Snacks.explorer() end";
      options.desc = "Explorer Snacks (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fe";
      action.__raw = "function() Snacks.explorer() end";
      options.desc = "Explorer Snacks (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>E";
      action.__raw = "function() Snacks.explorer({cwd = vim.fn.getcwd()}) end";
      options.desc = "Explorer Snacks (cwd)";
    }
  ];
}
