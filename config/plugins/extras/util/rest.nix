# LazyVim extra: util.rest
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/util/rest.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "util.rest" config.lazyvim.extras) {
    plugins.kulala.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "graphql"
      "http"
    ];

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>Rb";
        action = "<cmd>lua require('kulala').scratchpad()<cr>";
        options.desc = "Open scratchpad";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rc";
        action = "<cmd>lua require('kulala').copy()<cr>";
        options.desc = "Copy as cURL";
      }
      {
        mode = [ "n" ];
        key = "<leader>RC";
        action = "<cmd>lua require('kulala').from_curl()<cr>";
        options.desc = "Paste from curl";
      }
      {
        mode = [ "n" ];
        key = "<leader>Re";
        action = "<cmd>lua require('kulala').set_selected_env()<cr>";
        options.desc = "Set environment";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rg";
        action = "<cmd>lua require('kulala').download_graphql_schema()<cr>";
        options.desc = "Download GraphQL schema";
      }
      {
        mode = [ "n" ];
        key = "<leader>Ri";
        action = "<cmd>lua require('kulala').inspect()<cr>";
        options.desc = "Inspect current request";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rn";
        action = "<cmd>lua require('kulala').jump_next()<cr>";
        options.desc = "Jump to next request";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rp";
        action = "<cmd>lua require('kulala').jump_prev()<cr>";
        options.desc = "Jump to previous request";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rq";
        action = "<cmd>lua require('kulala').close()<cr>";
        options.desc = "Close window";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rr";
        action = "<cmd>lua require('kulala').replay()<cr>";
        options.desc = "Replay the last request";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rs";
        action = "<cmd>lua require('kulala').run()<cr>";
        options.desc = "Send the request";
      }
      {
        mode = [ "n" ];
        key = "<leader>RS";
        action = "<cmd>lua require('kulala').show_stats()<cr>";
        options.desc = "Show stats";
      }
      {
        mode = [ "n" ];
        key = "<leader>Rt";
        action = "<cmd>lua require('kulala').toggle_view()<cr>";
        options.desc = "Toggle headers/body";
      }
    ];
  };
}
