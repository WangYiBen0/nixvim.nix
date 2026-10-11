# LazyVim extra: lang.r
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/r.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.r" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "r"
      "rnoweb"
    ];

    plugins = {
      lsp = {
        servers = {
          r_language_server.enable = true;
        };
      };
    };
  };
}
