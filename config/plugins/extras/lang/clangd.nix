# LazyVim extra: lang.clangd
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/clangd.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.clangd" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "cpp"
    ];

    plugins = {
      lsp = {
        servers = {
          clangd.enable = true;
        };
      };
    };
  };
}
