# LazyVim extra: lang.r
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/r.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.r" config.lazyvim.extras) {
    plugins.neotest.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "r"
      "rnoweb"
    ];

    plugins = {
      lsp = {
        servers = {
          r_language_server.enable = true;
        };
      };
    };
  };
}
