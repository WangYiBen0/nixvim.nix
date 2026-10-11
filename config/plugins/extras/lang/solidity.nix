# LazyVim extra: lang.solidity
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/solidity.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.solidity" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "solidity"
    ];

    plugins = {
      lsp = {
        servers = {
          solidity_ls.enable = true;
        };
      };
    };
  };
}
