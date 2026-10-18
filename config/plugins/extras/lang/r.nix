# LazyVim extra: lang.r
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/r.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).r or false) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
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
