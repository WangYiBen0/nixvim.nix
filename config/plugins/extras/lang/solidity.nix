# LazyVim extra: lang.solidity
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/solidity.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).solidity or false) {

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
