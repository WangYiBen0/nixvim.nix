{
  plugins.mini-files = {
    enable = true;
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
    settings = {
      windows = {
        preview = true;
        width_focus = 30;
        width_preview = 30;
      };
      options = {
        # Whether to use mini.files for editing directories.
        # Disabled by default in LazyVim because a tree plugin is used for that.
        use_as_default_explorer = false;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fm";
      action.__raw = ''
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end
      '';
      options.desc = "Open mini.files (Directory of Current File)";
    }
    {
      mode = "n";
      key = "<leader>fM";
      action.__raw = ''
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end
      '';
      options.desc = "Open mini.files (cwd)";
    }
  ];

  autoCmd = [
    {
      event = "User";
      pattern = "MiniFilesBufferCreate";
      callback.__raw = ''
        function(args)
          local buf_id = args.data.buf_id

          local show_dotfiles = true
          local function filter_show(_)
            return true
          end
          local function filter_hide(fs_entry)
            return not vim.startswith(fs_entry.name, ".")
          end

          local function toggle_dotfiles()
            show_dotfiles = not show_dotfiles
            local new_filter = show_dotfiles and filter_show or filter_hide
            require("mini.files").refresh({ content = { filter = new_filter } })
          end

          local function map_split(lhs, direction, close_on_file)
            local rhs = function()
              local new_target_window
              local cur_target_window = require("mini.files").get_explorer_state().target_window
              if cur_target_window ~= nil then
                vim.api.nvim_win_call(cur_target_window, function()
                  vim.cmd("belowright " .. direction .. " split")
                  new_target_window = vim.api.nvim_get_current_win()
                end)

                require("mini.files").set_target_window(new_target_window)
                require("mini.files").go_in({ close_on_file = close_on_file })
              end
            end

            local desc = "Open in " .. direction .. " split"
            if close_on_file then
              desc = desc .. " and close"
            end
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
          end

          local function files_set_cwd()
            local cur_entry_path = MiniFiles.get_fs_entry().path
            local cur_directory = vim.fs.dirname(cur_entry_path)
            if cur_directory ~= nil then
              vim.fn.chdir(cur_directory)
            end
          end

          vim.keymap.set(
            "n",
            "g.",
            toggle_dotfiles,
            { buffer = buf_id, desc = "Toggle hidden files" }
          )

          vim.keymap.set(
            "n",
            "gc",
            files_set_cwd,
            { buffer = buf_id, desc = "Set cwd" }
          )

          map_split("<C-w>s", "horizontal", false)
          map_split("<C-w>v", "vertical", false)
          map_split("<C-w>S", "horizontal", true)
          map_split("<C-w>V", "vertical", true)
        end
      '';
    }
    {
      event = "User";
      pattern = "MiniFilesActionRename";
      callback.__raw = ''
        function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end
      '';
    }
  ];
}
