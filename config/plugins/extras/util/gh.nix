# LazyVim extra: util.gh
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/util/gh.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "util.gh" config.lazyvim.extras) {

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>Gcc";
        action = "<cmd>GHCloseCommit<cr>";
        options.desc = "Close";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gce";
        action = "<cmd>GHExpandCommit<cr>";
        options.desc = "Expand";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gco";
        action = "<cmd>GHOpenToCommit<cr>";
        options.desc = "Open To";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gcp";
        action = "<cmd>GHPopOutCommit<cr>";
        options.desc = "Pop Out";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gcz";
        action = "<cmd>GHCollapseCommit<cr>";
        options.desc = "Collapse";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gip";
        action = "<cmd>GHPreviewIssue<cr>";
        options.desc = "Preview";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gio";
        action = "<cmd>GHOpenIssue<cr>";
        options.desc = "Open";
      }
      {
        mode = [ "n" ];
        key = "<leader>Glt";
        action = "<cmd>LTPanel<cr>";
        options.desc = "Toggle Panel";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpc";
        action = "<cmd>GHClosePR<cr>";
        options.desc = "Close";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpd";
        action = "<cmd>GHPRDetails<cr>";
        options.desc = "Details";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpe";
        action = "<cmd>GHExpandPR<cr>";
        options.desc = "Expand";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpo";
        action = "<cmd>GHOpenPR<cr>";
        options.desc = "Open";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpp";
        action = "<cmd>GHPopOutPR<cr>";
        options.desc = "PopOut";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpr";
        action = "<cmd>GHRefreshPR<cr>";
        options.desc = "Refresh";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpt";
        action = "<cmd>GHOpenToPR<cr>";
        options.desc = "Open To";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gpz";
        action = "<cmd>GHCollapsePR<cr>";
        options.desc = "Collapse";
      }
      {
        mode = [ "n" ];
        key = "<leader>Grb";
        action = "<cmd>GHStartReview<cr>";
        options.desc = "Begin";
      }
      {
        mode = [ "n" ];
        key = "<leader>Grc";
        action = "<cmd>GHCloseReview<cr>";
        options.desc = "Close";
      }
      {
        mode = [ "n" ];
        key = "<leader>Grd";
        action = "<cmd>GHDeleteReview<cr>";
        options.desc = "Delete";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gre";
        action = "<cmd>GHExpandReview<cr>";
        options.desc = "Expand";
      }
      {
        mode = [ "n" ];
        key = "<leader>Grs";
        action = "<cmd>GHSubmitReview<cr>";
        options.desc = "Submit";
      }
      {
        mode = [ "n" ];
        key = "<leader>Grz";
        action = "<cmd>GHCollapseReview<cr>";
        options.desc = "Collapse";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gtc";
        action = "<cmd>GHCreateThread<cr>";
        options.desc = "Create";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gtn";
        action = "<cmd>GHNextThread<cr>";
        options.desc = "Next";
      }
      {
        mode = [ "n" ];
        key = "<leader>Gtt";
        action = "<cmd>GHToggleThread<cr>";
        options.desc = "Toggle";
      }
    ];
  };
}
