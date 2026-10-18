# LazyVim extra: lang.vue
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/vue.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.vue" config.extras) {

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
