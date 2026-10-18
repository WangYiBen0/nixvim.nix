# LazyVim extra: lang.clojure
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/clojure.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).clojure or false) {
    plugins.baleia.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "clojure"
    ];
  };
}
