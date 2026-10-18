# LazyVim extra: editor.overseer
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/overseer.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "editor.overseer" config.extras) {
    plugins.overseer.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>ow";
        action = "<cmd>OverseerToggle!<cr>";
        options.desc = "Task list";
      }
      {
        mode = [ "n" ];
        key = "<leader>oo";
        action = "<cmd>OverseerRun<cr>";
        options.desc = "Run task";
      }
      {
        mode = [ "n" ];
        key = "<leader>ot";
        action = "<cmd>OverseerTaskAction<cr>";
        options.desc = "Task action";
      }
    ];
  };
}
