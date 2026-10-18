# LazyVim extra: lang.nushell
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/nushell.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).nushell or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "nu"
    ];

    plugins = {
      lsp = {
        servers = {
          nushell.enable = true;
        };
      };
    };
  };
}
