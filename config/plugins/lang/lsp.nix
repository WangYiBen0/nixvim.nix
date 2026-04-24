{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      bashls = {
        enable = true;
      };

      clangd = {
        enable = true;
      };

      fish_lsp = {
        enable = true;
      };

      gopls = {
        enable = true;
      };

      html = {
        enable = true;
      };

      jsonls = {
        enable = true;
      };

      lua_ls = {
        enable = true;
      };

      marksman = {
        enable = true;
      };

      nixd = {
        enable = true;
      };

      pyright = {
        enable = true;
      };

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        installRustfmt = true;
      };

      systemd_ls = {
        enable = true;
      };

      texlab = {
        enable = true;
      };

      ts_ls = {
        enable = true;
      };

      tinymist = {
        enable = true;
      };

      vimls = {
        enable = true;
      };

      yamlls = {
        enable = true;
      };
    };
  };
}
