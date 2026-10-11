{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    inlayHints = true;

    capabilities = ''
      vim.tbl_deep_extend("force", capabilities, {
        workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        })
    '';

    # Port of LazyVim's `servers["*"].keys` (lazyvim/plugins/lsp/init.lua).
    # LazyVim gates most of these on the LSP method the server actually
    # supports (`has = "..."`), so they are registered from `onAttach` where
    # `client` and `bufnr` are in scope, rather than as unconditional maps.
    onAttach = ''
      local function map(mode, lhs, rhs, opts)
        vim.keymap.set(
          mode,
          lhs,
          rhs,
          vim.tbl_extend("force", { buffer = bufnr }, opts or {})
        )
      end

      local function has(method)
        method = method:find("/") and method or ("textDocument/" .. method)
        local ok, supported = pcall(function()
          return client:supports_method(method, { bufnr = bufnr })
        end)
        return ok and supported
      end

      -- stylua: ignore start
      map("n", "<leader>cl", function() Snacks.picker.lsp_config() end, { desc = "Lsp Info" })

      -- NOTE: `gd`/`gr`/`gI`/`gy`/`K`/`<leader>ca`/`<leader>cr` are already mapped
      -- in `config/keymaps.nix` (to the snacks picker LSP actions, matching
      -- LazyVim's snacks_picker extra), so they are intentionally not repeated
      -- here as buffer-local maps.
      map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

      if has("signatureHelp") then
        map("n", "gK", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
        map("i", "<c-k>", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
      end

      if has("codeAction") then
        map("n", "<leader>cA", function() LazyVim.lsp.action.source() end, { desc = "Source Action" })
      end
      if has("codeLens") then
        map({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
        map("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
      end
      if has({ "workspace/didRenameFiles", "workspace/willRenameFiles" }) then
        map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
      end

      -- References navigation, only while snacks words (document highlight) is on
      if has("documentHighlight") and Snacks.words.is_enabled() then
        map("n", "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
        map("n", "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
        map("n", "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, { desc = "Next Reference" })
        map("n", "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, { desc = "Prev Reference" })
      end

      if has("codeAction") then
        local code_actions = vim.tbl_filter(function(action)
          return action:find("^source%.organizeImports%.?$")
        end, LazyVim.lsp.code_actions({ bufnr = bufnr }))
        if #code_actions > 0 then
          map("n", "<leader>co", function() LazyVim.lsp.action["source.organizeImports"]() end, {
            desc = "Organize Imports",
          })
        end
      end
      -- stylua: ignore end

      -- LSP folds (LazyVim `opts.folds.enabled`)
      pcall(function()
        if client:supports_method("textDocument/foldingRange", { bufnr = bufnr }) then
          LazyVim.set_default("foldmethod", "expr")
          LazyVim.set_default("foldexpr", "v:lua.vim.lsp.foldexpr()")
        end
      end)
    '';

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      csharp_ls.enable = pkgs.stdenv.hostPlatform.isLinux;
      fish_lsp.enable = true;
      gopls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      just.enable = true;

      lua_ls = {
        enable = true;
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false;
            };
            codeLens = {
              enable = true;
            };
            completion = {
              callSnippet = "Replace";
            };
            doc = {
              privateName = [ "^_" ];
            };
            hint = {
              enable = true;
              setType = false;
              paramType = true;
              paramName = "Disable";
              semicolon = "Disable";
              arrayIndex = "Disable";
            };
          };
        };
      };

      marksman.enable = true;
      nixd.enable = true;
      pyright.enable = true;

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        installRustfmt = true;
      };

      systemd_ls.enable = true;
      taplo.enable = true;
      texlab.enable = true;
      ts_ls.enable = true;
      tinymist.enable = true;
      vimls.enable = true;
      yamlls.enable = true;
    };
  };

  # LazyVim's default `opts.diagnostics` (lazyvim/plugins/lsp/init.lua).
  # `signs.text` must be keyed by the numeric `vim.diagnostic.severity` values,
  # so that sub-table is emitted as raw Lua.
  diagnostic.settings = {
    underline = true;
    update_in_insert = false;
    virtual_text = {
      spacing = 4;
      source = "if_many";
      prefix = "●";
    };
    severity_sort = true;
    signs.__raw = ''
      {
        text = {
          [vim.diagnostic.severity.ERROR] = "\u{f057} ",
          [vim.diagnostic.severity.WARN] = "\u{f071} ",
          [vim.diagnostic.severity.HINT] = "\u{f0eb} ",
          [vim.diagnostic.severity.INFO] = "\u{f05a} ",
        },
      }
    '';
  };
}
