# LazyVim extra: lang.elm
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/elm.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.elm" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
