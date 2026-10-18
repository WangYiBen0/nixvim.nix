# LazyVim extra: lang.kotlin
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/kotlin.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.kotlin" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
