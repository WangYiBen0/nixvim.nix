# LazyVim extra: lang.erlang
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/erlang.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).erlang or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "erlang"
    ];

    plugins = {
      lsp = {
        servers = {
          elp.enable = true;
        };
      };
    };
  };
}
