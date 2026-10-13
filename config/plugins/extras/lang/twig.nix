# LazyVim extra: lang.twig
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/twig.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.twig" config.lazyvim.extras) {

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
