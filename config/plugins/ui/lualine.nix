{
  plugins.lualine = {
    enable = true;
    # Upstream lazy-loads lualine on VeryLazy. lz.n does not implement the
    # `VeryLazy` pseudo-event (it is not a real Neovim event either), so the
    # repo-wide equivalent is `DeferredUIEnter`. Deferring also guarantees that
    # `_G.LazyVim` (set up by our boot Lua) exists before the `opts` below are
    # evaluated, since nixvim runs plugin setup before `config.content`.
    lazyLoad.settings.event = [ "DeferredUIEnter" ];

    settings = {
      options = {
        theme = "auto";
        globalstatus = true;
        disabled_filetypes.statusline = [
          "dashboard"
          "alpha"
          "ministarter"
          "snacks_dashboard"
        ];
        # Kept from the pre-existing config (upstream relies on theme defaults).
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
      };

      sections = {
        lualine_a = [
          "mode"
          {
            # User addition (not upstream LazyVim): macro recording indicator.
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

        lualine_b = [ "branch" ];

        lualine_c = [
          { __raw = "LazyVim.lualine.root_dir()"; }
          {
            __raw = ''
              {
                "diagnostics",
                symbols = {
                  error = LazyVim.config.icons.diagnostics.Error,
                  warn = LazyVim.config.icons.diagnostics.Warn,
                  info = LazyVim.config.icons.diagnostics.Info,
                  hint = LazyVim.config.icons.diagnostics.Hint,
                },
              }
            '';
          }
          {
            __raw = ''
              { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }
            '';
          }
          { __raw = "LazyVim.lualine.pretty_path()"; }
          {
            # Trouble symbols (LazyVim adds these when trouble.nvim is enabled
            # and `vim.g.trouble_lualine` is not false).
            __raw = ''
              (function()
                if not (vim.g.trouble_lualine and LazyVim.has("trouble.nvim")) then
                  return nil
                end
                local symbols = require("trouble").statusline({
                  mode = "symbols",
                  groups = {},
                  title = false,
                  filter = { range = true },
                  format = "{kind_icon}{symbol.name:Normal}",
                  hl_group = "lualine_c_normal",
                })
                if not symbols then
                  return nil
                end
                return {
                  symbols.get,
                  cond = function()
                    return vim.b.trouble_lualine ~= false and symbols.has()
                  end,
                }
              end)()
            '';
          }
        ];

        lualine_x = [
          { __raw = "Snacks.profiler.status()"; }
          {
            __raw = ''
              {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = function() return { fg = Snacks.util.color("Statement") } end,
              }
            '';
          }
          {
            __raw = ''
              {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = function() return { fg = Snacks.util.color("Constant") } end,
              }
            '';
          }
          {
            __raw = ''
              {
                "diff",
                symbols = {
                  added = LazyVim.config.icons.git.added,
                  modified = LazyVim.config.icons.git.modified,
                  removed = LazyVim.config.icons.git.removed,
                },
                -- LazyVim's mini.diff extra replaces this source with
                -- `vim.b.minidiff_summary`; prefer it when mini.diff is active,
                -- otherwise fall back to the gitsigns status dict.
                source = function()
                  local summary = vim.b.minidiff_summary
                  if summary then
                    return {
                      added = summary.add,
                      modified = summary.change,
                      removed = summary.delete,
                    }
                  end
                  local gitsigns = vim.b.gitsigns_status_dict
                  if gitsigns then
                    return {
                      added = gitsigns.added,
                      modified = gitsigns.changed,
                      removed = gitsigns.removed,
                    }
                  end
                end,
              }
            '';
          }
        ];

        lualine_y = [
          {
            __unkeyed-1 = "progress";
            separator = " ";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "location";
            padding = {
              left = 0;
              right = 1;
            };
          }
        ];

        lualine_z = [
          {
            __unkeyed-1.__raw = ''
              function()
                return " " .. os.date("%R")
              end
            '';
          }
        ];
      };

      # `neo-tree` and `fzf` are not enabled here; `lazy` (the plugin manager)
      # is intentionally not implemented in this static port.
      extensions = [ "trouble" ];
    };
  };

  # LazyVim's lualine `init` hook: remember `laststatus` and hide the statusline
  # on the starter page until lualine loads.
  extraConfigLuaPre = ''
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  '';
}
