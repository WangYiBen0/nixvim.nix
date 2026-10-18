# LazyVim extra: editor.outline
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/outline.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.editor or { }).outline or false) {
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
