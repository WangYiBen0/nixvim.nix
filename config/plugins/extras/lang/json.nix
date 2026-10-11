# LazyVim extra: lang.json
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/json.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.json" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "json5"
    ];
  };
}
