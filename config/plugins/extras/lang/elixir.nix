# LazyVim extra: lang.elixir
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/elixir.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).elixir or false) {
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
