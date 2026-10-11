# LazyVim extra: lang.dotnet
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dotnet.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.dotnet" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "c_sharp"
      "fsharp"
    ];
  };
}
