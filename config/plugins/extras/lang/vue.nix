# LazyVim extra: lang.vue
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/vue.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).vue or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "css"
      "vue"
    ];

    plugins = {
      lsp = {
        servers = {
          vtsls.enable = true;
          vue_ls.enable = true;
        };
      };
    };
  };
}
