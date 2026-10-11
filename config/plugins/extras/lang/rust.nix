# LazyVim extra: lang.rust
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/rust.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.rust" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "ron"
      "rust"
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
