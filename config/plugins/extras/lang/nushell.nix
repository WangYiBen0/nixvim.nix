# LazyVim extra: lang.nushell
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/nushell.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.nushell" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
      "nu"
    ];

    plugins = {
      lsp = {
        servers = {
          nushell.enable = true;
        };
      };
    };
  };
}
