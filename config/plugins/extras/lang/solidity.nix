# LazyVim extra: lang.solidity
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/solidity.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.solidity" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
