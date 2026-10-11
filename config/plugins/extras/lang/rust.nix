# LazyVim extra: lang.rust
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/rust.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.rust" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "rust"
      "ron"
    ];

    plugins = {
      lsp = {
        servers = {
          rust_analyzer.enable = true;
          bacon_ls.enable = true;
        };
      };
    };
  };
}
