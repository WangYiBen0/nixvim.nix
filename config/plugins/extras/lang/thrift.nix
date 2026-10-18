# LazyVim extra: lang.thrift
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/thrift.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.thrift" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
