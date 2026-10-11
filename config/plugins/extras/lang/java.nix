# LazyVim extra: lang.java
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/java.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.java" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "java"
    ];
  };
}
