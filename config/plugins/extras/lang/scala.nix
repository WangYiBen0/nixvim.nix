# LazyVim extra: lang.scala
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/scala.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.scala" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "scala"
    ];
  };
}
