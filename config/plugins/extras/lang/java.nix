# LazyVim extra: lang.java
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/java.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.java" config.lazyvim.extras) {

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
