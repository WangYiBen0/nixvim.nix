{
  keymaps = [
    # --- General ---
    {
      mode = [
        "n"
        "x"
      ];
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        expr = true;
        silent = true;
        desc = "Down";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        expr = true;
        silent = true;
        desc = "Up";
      };
    }

    # Move Code Blocks (Alt + jk)
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>==";
      options.desc = "Move Down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>==";
      options.desc = "Move Up";
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      options.desc = "Move Down";
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      options.desc = "Move Up";
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move Down";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move Up";
    }

    # ^[ -> :nohighlight
    {
      mode = [
        "i"
        "n"
      ];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options.desc = "Escape and Clear hlsearch";
    }

    # Better Indent
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }

    # --- Window Management ---
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to Left Window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to Lower Window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to Upper Window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to Right Window";
    }

    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-w>p";
      options.desc = "Other Window";
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-w>c";
      options.desc = "Delete Window";
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-w>s";
      options.desc = "Split Window Below";
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-w>v";
      options.desc = "Split Window Right";
    }

    # Scaling
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options.desc = "Increase Window Height";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options.desc = "Decrease Window Height";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      options.desc = "Decrease Window Width";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      options.desc = "Increase Window Width";
    }

    # --- Buffers ---
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bd<cr>";
      options.desc = "Delete Buffer";
    }

    # --- LSP Actions ---
    {
      mode = "n";
      key = "gd";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options.desc = "Goto Definition";
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options.desc = "References";
    }
    {
      mode = "n";
      key = "gI";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options.desc = "Goto Implementation";
    }
    {
      mode = "n";
      key = "gy";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
      options.desc = "Goto Type Definition";
    }
    {
      mode = "n";
      key = "K";
      action = "v:lua.vim.lsp.buf.hover";
      options.desc = "Hover";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action.__raw = "function() Snacks.picker.lsp_symbols() end";
      options.desc = "LSP Symbols";
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "v:lua.vim.lsp.buf.code_action";
      options.desc = "Code Action";
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "v:lua.vim.lsp.buf.rename";
      options.desc = "Rename";
    }
    {
      mode = "n";
      key = "<leader>cd";
      action = "v:lua.vim.diagnostic.open_float";
      options.desc = "Line Diagnostics";
    }
    {
      mode = "n";
      key = "[d";
      action = "v:lua.vim.diagnostic.goto_prev";
      options.desc = "Prev Diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action = "v:lua.vim.diagnostic.goto_next";
      options.desc = "Next Diagnostic";
    }

    # --- Tools/UI ---
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

    # UI switch (Toggle)
    {
      mode = "n";
      key = "<leader>uf";
      action.__raw = "function() vim.g.autoformat = not vim.g.autoformat end";
      options.desc = "Toggle Auto Format (Global)";
    }
    {
      mode = "n";
      key = "<leader>us";
      action = "<cmd>set spell!<cr>";
      options.desc = "Toggle Spelling";
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = "<cmd>set wrap!<cr>";
      options.desc = "Toggle Word Wrap";
    }
    {
      mode = "n";
      key = "<leader>ud";
      action.__raw = "function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end";
      options.desc = "Toggle Diagnostics";
    }
  ];
}
