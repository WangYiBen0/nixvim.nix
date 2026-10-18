# LazyVim extra: lang.php
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/php.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).php or false) {
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
