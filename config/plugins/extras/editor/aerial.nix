# LazyVim extra: editor.aerial
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/aerial.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.editor or { }).aerial or false) {
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
