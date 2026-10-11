# LazyVim extra: lang.angular
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/angular.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.angular" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          angularls.enable = true;
        };
      };
    };
  };
}
