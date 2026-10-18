# LazyVim extra: lang.svelte
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/svelte.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.svelte" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
