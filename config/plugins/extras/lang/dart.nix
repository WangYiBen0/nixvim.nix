# LazyVim extra: lang.dart
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dart.lua
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
