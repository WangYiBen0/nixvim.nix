{
  # LazyVim's coding.blink extra configures lazydev for Neovim Lua development.
  plugins.lazydev = {
    enable = true;
    lazyLoad.settings.ft = [ "lua" ];
    settings.library = [
      {
        path = "\${3rd}/luv/library";
        words = [ "vim%.uv" ];
      }
      {
        path = "LazyVim";
        words = [ "LazyVim" ];
      }
      {
        path = "snacks.nvim";
        words = [ "Snacks" ];
      }
      {
        path = "nvim-lspconfig";
        words = [ "lspconfig.settings" ];
      }
    ];
  };
}
