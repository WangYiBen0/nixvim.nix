# LazyVim extra: lang.prisma
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/prisma.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.prisma" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "prisma"
    ];

    plugins = {
      lsp = {
        servers = {
          prismals.enable = true;
        };
      };
    };
  };
}
