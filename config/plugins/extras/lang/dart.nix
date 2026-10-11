# LazyVim extra: lang.dart
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dart.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.dart" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "dart"
    ];

    plugins = {
      lsp = {
        servers = {
          dartls.enable = true;
        };
      };
    };
  };
}
