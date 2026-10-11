# LazyVim extra: lang.ember
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ember.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.ember" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
