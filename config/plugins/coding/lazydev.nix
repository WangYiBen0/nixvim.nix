{
  # LazyVim's coding.blink extra configures lazydev for Neovim Lua development.
  #
  # NOTE: this is deliberately NOT lazy-loaded. blink.cmp registers
  # `lazydev.integrations.blink` as a completion source and requires that module
  # as soon as it builds its provider list, which happens on InsertEnter in any
  # buffer. With `ft = "lua"` lazy loading, lazydev is not on the runtimepath at
  # that point, so `:checkhealth blink.cmp` fails with
  # "module 'lazydev.integrations.blink' not found". Loading it eagerly keeps the
  # integration resolvable; lazydev itself still only attaches to Lua buffers.
  plugins.lazydev = {
    enable = true;
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
