# LazyVim extra: lang.typst
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typst.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.typst" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "typst"
    ];
  };
}
