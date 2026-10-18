{
  plugins.bufferline = {
    enable = true;
    # Upstream lazy-loads bufferline on VeryLazy; `DeferredUIEnter` is the
    # lz.n equivalent (VeryLazy is not a real Neovim event).
    lazyLoad.settings.event = [ "DeferredUIEnter" ];

    settings = {
      options = {
        # stylua: ignore
        close_command.__raw = "function(n) Snacks.bufdelete(n) end";
        # stylua: ignore
        right_mouse_command.__raw = "function(n) Snacks.bufdelete(n) end";
        diagnostics = "nvim_lsp";
        always_show_bufferline = false;
        diagnostics_indicator.__raw = ''
          function(_, _, diag)
            local icons = LazyVim.config.icons.diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end
        '';
        # NOTE: upstream also offsets `neo-tree`, which is not enabled here.
        offsets = [
          {
            filetype = "snacks_layout_box";
          }
        ];
        get_element_icon.__raw = ''
          function(opts)
            return LazyVim.config.icons.ft[opts.filetype]
          end
        '';
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>bp";
      action = "<Cmd>BufferLineTogglePin<CR>";
      options.desc = "Toggle Pin";
    }
    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options.desc = "Delete Non-Pinned Buffers";
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<Cmd>BufferLineCloseRight<CR>";
      options.desc = "Delete Buffers to the Right";
    }
    {
      mode = "n";
      key = "<leader>bl";
      action = "<Cmd>BufferLineCloseLeft<CR>";
      options.desc = "Delete Buffers to the Left";
    }
    {
      mode = "n";
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      options.desc = "Move buffer prev";
    }
    {
      mode = "n";
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      options.desc = "Move buffer next";
    }
    {
      mode = "n";
      key = "<leader>bj";
      action = "<cmd>BufferLinePick<cr>";
      options.desc = "Pick Buffer";
    }
  ];

  # Fix bufferline when restoring a session (LazyVim's bufferline `config`).
  autoCmd = [
    {
      event = [
        "BufAdd"
        "BufDelete"
      ];
      callback.__raw = ''
        function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end
      '';
    }
  ];
}
