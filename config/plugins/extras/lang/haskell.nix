# LazyVim extra: lang.haskell
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/haskell.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.haskell" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "haskell"
    ];

    plugins = {
      lint = {
        lintersByFt = {
          haskell = [ "hlint" ];
        };
      };
    };
  };
}
