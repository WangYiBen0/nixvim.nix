# LazyVim extra: lang.elm
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/elm.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).elm or false) {

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
