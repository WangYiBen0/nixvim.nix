# LazyVim extra: lang.typst
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typst.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.typst" config.extras) {
    plugins.typst-preview.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
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

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>cp";
        action = "<cmd>TypstPreviewToggle<cr>";
        options.desc = "Toggle Typst Preview";
      }
    ];
  };
}
