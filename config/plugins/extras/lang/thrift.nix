# LazyVim extra: lang.thrift
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/thrift.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).thrift or false) {

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
