# LazyVim extra: lang.erlang
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/erlang.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.erlang" config.lazyvim.extras) {

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "erlang"
    ];

    plugins = {
      lsp = {
        servers = {
          elp.enable = true;
        };
      };
    };
  };
}
