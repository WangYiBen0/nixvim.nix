# LazyVim extra: editor.mini-diff
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/mini-diff.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "editor.mini-diff" config.lazyvim.extras) {

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>go";
        action.__raw = "        function()
          require(\"mini.diff\").toggle_overlay(0)
        end";
        options.desc = "Toggle mini.diff overlay";
      }
    ];
  };
}
