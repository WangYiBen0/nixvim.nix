# LazyVim extra: lang.rust
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/rust.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).rust or false) {
    plugins.crates.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
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
