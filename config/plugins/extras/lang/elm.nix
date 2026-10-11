# LazyVim extra: lang.elm
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/elm.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.elm" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "elm"
    ];

    plugins = {
      lsp = {
        servers = {
          elmls.enable = true;
        };
      };
    };
  };
}
