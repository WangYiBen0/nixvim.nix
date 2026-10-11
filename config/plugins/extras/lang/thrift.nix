# LazyVim extra: lang.thrift
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/thrift.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.thrift" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "thrift"
    ];

    plugins = {
      lsp = {
        servers = {
          thriftls.enable = true;
        };
      };
    };
  };
}
