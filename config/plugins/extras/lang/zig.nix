# LazyVim extra: lang.zig
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/zig.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.zig" config.extras) {
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
