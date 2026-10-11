# LazyVim extra: lang.go
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/go.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.go" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "go"
      "gomod"
      "gowork"
      "gosum"
    ];

    plugins = {
      lint = {
        lintersByFt = {
          go = [ "golangcilint" ];
        };
      };
    };
  };
}
