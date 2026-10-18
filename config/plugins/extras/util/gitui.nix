# LazyVim extra: util.gitui
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/util/gitui.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.util or { }).gitui or false) {

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>gG";
        action.__raw = "        function()
          Snacks.terminal({ \"gitui\" })
        end";
        options.desc = "GitUi (cwd)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gg";
        action.__raw = "        function()
          Snacks.terminal({ \"gitui\" }, { cwd = LazyVim.root.get() })
        end";
        options.desc = "GitUi (Root Dir)";
      }
    ];
  };
}
