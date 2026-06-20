{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_fallback = true;
        timeout_ms = 500;
      };
      formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "black" ];
        nix = [ "nixfmt" ];
        javascript = [ "prettierd" ];
      };
    };
  };
}
