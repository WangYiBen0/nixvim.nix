# LazyVim extra: lang.java
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/java.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).java or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "java"
    ];

    plugins = {
      lsp = {
        servers = {
          jdtls.enable = true;
        };
      };
    };
  };
}
