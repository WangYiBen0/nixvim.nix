# LazyVim extra: test.core
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/test/core.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.test or { }).core or false) {
    plugins.neotest.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>ta";
        action.__raw = "      { \"<leader>ta\", function() require(\"neotest\").run.attach() end, desc = \"Attach to Test (Neotest)\" }";
        options.desc = "Attach to Test (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tt";
        action.__raw = "      { \"<leader>tt\", function() require(\"neotest\").run.run(vim.fn.expand(\"%\")) end, desc = \"Run File (Neotest)\" }";
        options.desc = "Run File (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tT";
        action.__raw = "      { \"<leader>tT\", function() require(\"neotest\").run.run(vim.uv.cwd()) end, desc = \"Run All Test Files (Neotest)\" }";
        options.desc = "Run All Test Files (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tr";
        action.__raw = "      { \"<leader>tr\", function() require(\"neotest\").run.run() end, desc = \"Run Nearest (Neotest)\" }";
        options.desc = "Run Nearest (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tl";
        action.__raw = "      { \"<leader>tl\", function() require(\"neotest\").run.run_last() end, desc = \"Run Last (Neotest)\" }";
        options.desc = "Run Last (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>ts";
        action.__raw = "      { \"<leader>ts\", function() require(\"neotest\").summary.toggle() end, desc = \"Toggle Summary (Neotest)\" }";
        options.desc = "Toggle Summary (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>to";
        action.__raw = "      { \"<leader>to\", function() require(\"neotest\").output.open({ enter = true, auto_close = true }) end, desc = \"Show Output (Neotest)\" }";
        options.desc = "Show Output (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tO";
        action.__raw = "      { \"<leader>tO\", function() require(\"neotest\").output_panel.toggle() end, desc = \"Toggle Output Panel (Neotest)\" }";
        options.desc = "Toggle Output Panel (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tS";
        action.__raw = "      { \"<leader>tS\", function() require(\"neotest\").run.stop() end, desc = \"Stop (Neotest)\" }";
        options.desc = "Stop (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>tw";
        action.__raw = "      { \"<leader>tw\", function() require(\"neotest\").watch.toggle(vim.fn.expand(\"%\")) end, desc = \"Toggle Watch (Neotest)\" }";
        options.desc = "Toggle Watch (Neotest)";
      }
      {
        mode = [ "n" ];
        key = "<leader>td";
        action.__raw = "      { \"<leader>td\", function() require(\"neotest\").run.run({strategy = \"dap\"}) end, desc = \"Debug Nearest\" }";
        options.desc = "Debug Nearest";
      }
    ];
  };
}
