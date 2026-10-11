# LazyVim extra: util.rest
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/util/rest.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "util.rest" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "http"
      "graphql"
    ];
  };
}
