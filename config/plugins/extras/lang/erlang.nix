# LazyVim extra: lang.erlang
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/erlang.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.erlang" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "erlang"
    ];

    # not ported: nixvim has no LSP server module `erlangls`
  };
}
