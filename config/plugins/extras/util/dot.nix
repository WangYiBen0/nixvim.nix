# LazyVim extra: util.dot
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/util/dot.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "util.dot" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          bashls.enable = true;
        };
      };
    };
  };
}
