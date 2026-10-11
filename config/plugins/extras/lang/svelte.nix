# LazyVim extra: lang.svelte
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/svelte.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.svelte" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "svelte"
    ];

    plugins = {
      lsp = {
        servers = {
          svelte.enable = true;
        };
      };
    };
  };
}
