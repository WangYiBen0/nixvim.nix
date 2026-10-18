# LazyVim extra: editor.neo-tree
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/neo-tree.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.editor or { }).neo-tree or false) {

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>fe";
        action.__raw = "        function()
          require(\"neo-tree.command\").execute({ toggle = true, dir = LazyVim.root() })
        end";
        options.desc = "Explorer NeoTree (Root Dir)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fE";
        action.__raw = "        function()
          require(\"neo-tree.command\").execute({ toggle = true, dir = vim.uv.cwd() })
        end";
        options.desc = "Explorer NeoTree (cwd)";
      }
      {
        mode = [ "n" ];
        key = "<leader>e";
        action = "<leader>fe";
        options.desc = "Explorer NeoTree (Root Dir)";
      }
      {
        mode = [ "n" ];
        key = "<leader>E";
        action = "<leader>fE";
        options.desc = "Explorer NeoTree (cwd)";
      }
      {
        mode = [ "n" ];
        key = "<leader>ge";
        action.__raw = "        function()
          require(\"neo-tree.command\").execute({ source = \"git_status\", toggle = true })
        end";
        options.desc = "Git Explorer";
      }
      {
        mode = [ "n" ];
        key = "<leader>be";
        action.__raw = "        function()
          require(\"neo-tree.command\").execute({ source = \"buffers\", toggle = true })
        end";
        options.desc = "Buffer Explorer";
      }
    ];
  };
}
