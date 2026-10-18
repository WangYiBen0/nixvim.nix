# LazyVim extra: lang.ember
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ember.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).ember or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "css"
      "glimmer"
      "glimmer_javascript"
      "glimmer_typescript"
    ];

    plugins = {
      lsp = {
        servers = {
          ember.enable = true;
        };
      };
    };
  };
}
