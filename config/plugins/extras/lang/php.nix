# LazyVim extra: lang.php
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/php.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.php" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "php"
    ];

    plugins = {
      lsp = {
        servers = {
          intelephense.enable = true;
          phpactor.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          php = [ "phpcs" ];
        };
      };
    };
  };
}
