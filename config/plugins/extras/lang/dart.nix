# LazyVim extra: lang.dart
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dart.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.dart" config.extras) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
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
