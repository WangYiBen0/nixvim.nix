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

    # --- Search ---
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.smart()<CR>";
      options.desc = "Smart Find Files";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options.desc = "Recent Files";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options.desc = "Grep (Global Search)";
    }
    {
      mode = "n";
      key = "<leader>sw";
      action = "<cmd>lua Snacks.picker.grep_word()<CR>";
      options.desc = "Search Word Under Cursor";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      options.desc = "Search Keymaps";
    }
    {
      mode = "n";
      key = "<leader>sq";
      action = "<cmd>lua Snacks.picker.qflist()<CR>";
      options.desc = "Quickfix List";
    }

    # --- LSP Actions ---
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua Snacks.picker.lsp_definitions()<cr>";
      options.desc = "Goto Definition";
    }
    {
      mode = "n";
      key = "gr";
      action = "<cmd>lua Snacks.picker.lsp_references()<cr>";
      options.desc = "References";
    }
    {
      mode = "n";
      key = "gI";
      action = "<cmd>lua Snacks.picker.lsp_implementations()<cr>";
      options.desc = "Goto Implementation";
    }
    {
      mode = "n";
      key = "gy";
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>";
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
      action = "<cmd>lua Snacks.picker.lsp_symbols()<cr>";
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
      action = "<cmd>lua Snacks.explorer()<cr>";
      options.desc = "Explorer Snacks (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>lua Snacks.explorer()<cr>";
      options.desc = "Explorer Snacks (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>lua Snacks.explorer({cwd = vim.fn.getcwd()})<cr>";
      options.desc = "Explorer Snacks (cwd)";
    }

    # Floating terminal (Snacks)
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>lua Snacks.terminal()<cr>";
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = "n";
      key = "<C-/>";
      action = "<cmd>lua Snacks.terminal()<cr>";
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = "t";
      key = "<C-/>";
      action = "<cmd>close<cr>";
      options.desc = "Hide Terminal";
    }

    # UI switch (Toggle)
    {
      mode = "n";
      key = "<leader>uf";
      action = "<cmd>lua vim.g.autoformat = not vim.g.autoformat<cr>";
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
      action = "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>";
      options.desc = "Toggle Diagnostics";
    }

    # Diagnostics (Trouble)
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }

    # Scratchpad (Snacks)
    {
      mode = "n";
      key = "<leader>ns";
      action = "<cmd>lua Snacks.scratch()<CR>";
      options.desc = "Toggle Scratchpad";
    }
    {
      mode = "n";
      key = "<leader>nS";
      action = "<cmd>lua Snacks.scratch.select()<CR>";
      options.desc = "Select Scratchpad";
    }
  ];
}
