{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_fallback = true;
        timeout_ms = 500;
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
