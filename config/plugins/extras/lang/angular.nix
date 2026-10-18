# LazyVim extra: lang.angular
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/angular.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).angular or false) {

    plugins = {
      lsp = {
        servers = {
          angularls.enable = true;
        };
      };
    };
  };
}
