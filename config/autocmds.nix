{
  autoGroups = {
    lazyvim_checktime = {
      clear = true;
    };
    lazyvim_highlight_yank = {
      clear = true;
    };
    lazyvim_resize_splits = {
      clear = true;
    };
    lazyvim_last_loc = {
      clear = true;
    };
    lazyvim_close_with_q = {
      clear = true;
    };
    lazyvim_man_unlisted = {
      clear = true;
    };
    lazyvim_wrap_spell = {
      clear = true;
    };
    lazyvim_json_conceal = {
      clear = true;
    };
    lazyvim_auto_create_dir = {
      clear = true;
    };
  };

  autoCmd = [
    {
      group = "lazyvim_checktime";
      event = [
        "FocusGained"
        "TermClose"
        "TermLeave"
      ];
      callback = {
        __raw = ''
          function()
            if vim.o.buftype ~= "nofile" then
              vim.cmd("checktime")
            end
          end
        '';
      };
    }
    {
      group = "lazyvim_highlight_yank";
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            if vim.fn.has("nvim-0.13") == 1 then
              vim.hl.hl_op()
            else
              (vim.hl or vim.highlight).on_yank()
            end
          end
        '';
      };
    }
    {
      group = "lazyvim_resize_splits";
      event = [ "VimResized" ];
      callback = {
        __raw = ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
      };
    }
    {
      group = "lazyvim_last_loc";
      event = [ "BufReadPost" ];
      callback = {
        __raw = ''
          function(event)
            local exclude = { "gitcommit" }
            local buf = event.buf
            if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
              return
            end
            vim.b[buf].lazyvim_last_loc = true
            local mark = vim.api.nvim_buf_get_mark(buf, '"')
            local lcount = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
      };
    }
    {
      group = "lazyvim_close_with_q";
      event = [ "FileType" ];
      pattern = [
        "PlenaryTestPopup"
        "checkhealth"
        "dap-float"
        "dbout"
        "gitsigns-blame"
        "grug-far"
        "help"
        "lspinfo"
        "neotest-output"
        "neotest-output-panel"
        "neotest-summary"
        "notify"
        "qf"
        "spectre_panel"
        "startuptime"
        "tsplayground"
      ];
      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.schedule(function()
              vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
              end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
              })
            end)
          end
        '';
      };
    }
    {
      group = "lazyvim_man_unlisted";
      event = [ "FileType" ];
      pattern = [ "man" ];
      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
          end
        '';
      };
    }
    {
      group = "lazyvim_wrap_spell";
      event = [ "FileType" ];
      pattern = [
        "text"
        "plaintex"
        "typst"
        "gitcommit"
        "markdown"
      ];
      callback = {
        __raw = ''
          function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end
        '';
      };
    }
    {
      group = "lazyvim_json_conceal";
      event = [ "FileType" ];
      pattern = [
        "json"
        "jsonc"
        "json5"
      ];
      callback = {
        __raw = ''
          function()
            vim.opt_local.conceallevel = 0
          end
        '';
      };
    }
    {
      group = "lazyvim_auto_create_dir";
      event = [ "BufWritePre" ];
      callback = {
        __raw = ''
          function(event)
            if event.match:match("^%w%w+:[\\/][\\/]") then
              return
            end
            local file = vim.uv.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
          end
        '';
      };
    }
  ];
}
