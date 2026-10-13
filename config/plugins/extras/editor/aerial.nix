# LazyVim extra: editor.aerial
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/aerial.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "editor.aerial" config.lazyvim.extras) {
    plugins.aerial.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>cs";
        action = "<cmd>AerialToggle<cr>";
        options.desc = "Aerial (Symbols)";
      }
      {
        mode = [ "n" ];
        key = "<leader>ss";
        action = "<cmd>Telescope aerial<cr>";
        options.desc = "Goto Symbol (Aerial)";
      }
    ];
  };
}
