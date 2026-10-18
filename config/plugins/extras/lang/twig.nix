# LazyVim extra: lang.twig
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/twig.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.twig" config.extras) {

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
