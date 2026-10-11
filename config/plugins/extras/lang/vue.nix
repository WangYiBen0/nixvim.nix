# LazyVim extra: lang.vue
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/vue.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.vue" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "css"
      "vue"
    ];

    plugins = {
      lsp = {
        servers = {
          vue_ls.enable = true;
          vtsls.enable = true;
        };
      };
    };
  };
}
