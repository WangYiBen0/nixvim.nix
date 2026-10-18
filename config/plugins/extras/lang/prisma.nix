# LazyVim extra: lang.prisma
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/prisma.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).prisma or false) {

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
