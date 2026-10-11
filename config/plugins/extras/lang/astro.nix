# LazyVim extra: lang.astro
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/astro.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.astro" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
