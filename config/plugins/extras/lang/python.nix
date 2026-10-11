# LazyVim extra: lang.python
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/python.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.python" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "ninja"
      "rst"
    ];
  };
}
