# LazyVim extra: lang.clojure
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/clojure.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.clojure" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "clojure"
    ];
  };
}
