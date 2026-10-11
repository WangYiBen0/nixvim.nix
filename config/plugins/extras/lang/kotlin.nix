# LazyVim extra: lang.kotlin
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/kotlin.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.kotlin" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "kotlin"
    ];

    plugins = {
      lsp = {
        servers = {
          kotlin_language_server.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          kotlin = [ "ktlint" ];
        };
      };
    };
  };
}
