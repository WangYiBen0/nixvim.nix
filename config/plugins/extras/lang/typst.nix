# LazyVim extra: lang.typst
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typst.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.typst" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "typst"
    ];

    plugins = {
      lsp = {
        servers = {
          tinymist.enable = true;
          tinymist.settings = {
            formatterMode = "typstyle";
          };
        };
      };
    };
  };
}
