# LazyVim extra: lang.gleam
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/gleam.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).gleam or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "gleam"
    ];

    plugins = {
      lsp = {
        servers = {
          gleam.enable = true;
        };
      };
    };
  };
}
