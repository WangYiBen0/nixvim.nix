# LazyVim extra: lang.astro
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/astro.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.astro" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
      "astro"
      "css"
    ];

    plugins = {
      lsp = {
        servers = {
          astro.enable = true;
        };
      };
    };
  };
}
