# LazyVim extra: util.dot
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/util/dot.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.util or { }).dot or false) {

    plugins = {
      lsp = {
        servers = {
          bashls.enable = true;
        };
      };
    };
  };
}
