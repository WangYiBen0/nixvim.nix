# LazyVim extra: lang.rust
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/rust.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.rust" config.lazyvim.extras) {
    plugins.crates.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "ron"
      "rust"
    ];

    plugins = {
      lsp = {
        servers = {
          bacon_ls.enable = true;
          rust_analyzer.enable = true;
        };
      };
    };
  };
}
