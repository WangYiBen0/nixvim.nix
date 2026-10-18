# LazyVim extra: lang.astro
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/astro.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).astro or false) {

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
