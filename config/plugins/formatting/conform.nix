{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      # NOTE: LazyVim deliberately does NOT set `format_on_save` for conform.
      # Saving is driven by `LazyVim.format` via its own `BufWritePre` autocmd
      # (see `lua/lazyvim/util/format.lua`), which is what makes `vim.g.autoformat`
      # and the `<leader>uf` / `<leader>uF` toggles work. Setting it here as well
      # would format twice on every write.
      default_format_opts = {
        timeout_ms = 3000;
        async = false;
        quiet = false;
        lsp_format = "fallback";
      };

      formatters_by_ft = {
        csharp = [ "csharpier" ];
        lua = [ "stylua" ];
        javascript = [ "prettierd" ];
        json = [ "prettierd" ];
        jsonc = [ "prettierd" ];
        just = [ "just" ];
        kdl = [ "kdlfmt" ];
        nix = [ "nixfmt" ];
        python = [ "black" ];
        rust = [ "rustfmt" ];
        toml = [ "taplo" ];
        xml = [ "xmllint" ];
        yaml = [ "prettierd" ];
      };
    };
  };
}
