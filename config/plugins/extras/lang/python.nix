# LazyVim extra: lang.python
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/python.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.python" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "ninja"
      "rst"
    ];

    plugins = {
      lsp = {
        servers = {
          ruff_lsp.enable = true;
          ruff.enable = true;
        };
      };
    };
  };
}
