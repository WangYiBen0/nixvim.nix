# LazyVim extra: lang.prisma
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/prisma.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.prisma" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
