# LazyVim extra: lang.php
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/php.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.php" config.extras) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
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
