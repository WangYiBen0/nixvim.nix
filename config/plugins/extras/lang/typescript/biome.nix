# LazyVim extra: lang.typescript.biome
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typescript/biome.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.typescript.biome" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          biome.enable = true;
        };
      };
    };
  };
}
