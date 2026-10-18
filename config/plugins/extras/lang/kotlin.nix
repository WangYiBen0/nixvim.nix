# LazyVim extra: lang.kotlin
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/kotlin.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).kotlin or false) {

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
