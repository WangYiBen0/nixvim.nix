# LazyVim extra: lang.svelte
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/svelte.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).svelte or false) {

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
