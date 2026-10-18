# LazyVim extra: lang.typescript.biome
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typescript/biome.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.typescript.biome" config.extras) {

    plugins = {
      lsp = {
        servers = {
          biome.enable = true;
        };
      };
    };
  };
}
