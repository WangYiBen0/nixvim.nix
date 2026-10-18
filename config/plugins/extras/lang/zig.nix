# LazyVim extra: lang.zig
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/zig.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).zig or false) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "zig"
    ];

    plugins = {
      lsp = {
        servers = {
          zls.enable = true;
        };
      };
    };
  };
}
