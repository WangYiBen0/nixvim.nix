# LazyVim extra: editor.outline
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/outline.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "editor.outline" config.extras) {
    plugins.edgy.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>cs";
        action = "<cmd>Outline<cr>";
        options.desc = "Toggle Outline";
      }
    ];
  };
}
