# LazyVim extra: lang.typescript.biome
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typescript/biome.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).typescript or false) {

    plugins = {
      lsp = {
        servers = {
          biome.enable = true;
        };
      };
    };
  };
}
