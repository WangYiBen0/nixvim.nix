# LazyVim extra: lang.gleam
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/gleam.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.gleam" config.extras) {

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
