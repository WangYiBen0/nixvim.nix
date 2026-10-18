# LazyVim extra: util.octo
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/util/octo.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "util.octo" config.extras) {
    plugins.octo.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>gi";
        action = "<cmd>Octo issue list<CR>";
        options.desc = "List Issues (Octo)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gI";
        action = "<cmd>Octo issue search<CR>";
        options.desc = "Search Issues (Octo)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gp";
        action = "<cmd>Octo pr list<CR>";
        options.desc = "List PRs (Octo)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gP";
        action = "<cmd>Octo pr search<CR>";
        options.desc = "Search PRs (Octo)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gr";
        action = "<cmd>Octo repo list<CR>";
        options.desc = "List Repos (Octo)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gS";
        action = "<cmd>Octo search<CR>";
        options.desc = "Search (Octo)";
      }
      {
        mode = [ "i" ];
        key = "@";
        action = "@<C-x><C-o>";
      }
      {
        mode = [ "i" ];
        key = "#";
        action = "#<C-x><C-o>";
      }
    ];
  };
}
