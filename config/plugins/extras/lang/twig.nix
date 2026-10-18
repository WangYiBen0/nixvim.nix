# LazyVim extra: lang.twig
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/twig.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).twig or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "twig"
    ];

    plugins = {
      lsp = {
        servers = {
          twiggy_language_server.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          twig = [ "twigcs" ];
        };
      };
    };
  };
}
