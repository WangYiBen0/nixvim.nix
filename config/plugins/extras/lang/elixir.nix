# LazyVim extra: lang.elixir
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/elixir.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.elixir" config.lazyvim.extras) {
    plugins.neotest.enable = true;

    plugins = {
      lsp = {
        servers = {
          elixirls.enable = true;
        };
      };
    };
  };
}
