# LazyVim extra: lang.php
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/php.lua
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
          phpactor.enable = true;
          intelephense.enable = true;
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
