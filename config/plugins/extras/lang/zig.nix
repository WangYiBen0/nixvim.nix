# LazyVim extra: lang.zig
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/zig.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.zig" config.lazyvim.extras) {
    plugins.neotest.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
