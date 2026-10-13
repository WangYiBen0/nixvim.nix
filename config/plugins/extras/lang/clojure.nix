# LazyVim extra: lang.clojure
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/clojure.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.clojure" config.lazyvim.extras) {
    plugins.baleia.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "clojure"
    ];
  };
}
