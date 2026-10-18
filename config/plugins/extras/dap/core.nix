# LazyVim extra: dap.core
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/dap/core.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.dap or { }).core or false) {

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>dB";
        action.__raw = "      { \"<leader>dB\", function() require(\"dap\").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = \"Breakpoint Condition\" }";
        options.desc = "Breakpoint Condition";
      }
      {
        mode = [ "n" ];
        key = "<leader>db";
        action.__raw = "      { \"<leader>db\", function() require(\"dap\").toggle_breakpoint() end, desc = \"Toggle Breakpoint\" }";
        options.desc = "Toggle Breakpoint";
      }
      {
        mode = [ "n" ];
        key = "<leader>dc";
        action.__raw = "      { \"<leader>dc\", function() require(\"dap\").continue() end, desc = \"Run/Continue\" }";
        options.desc = "Run/Continue";
      }
      {
        mode = [ "n" ];
        key = "<leader>da";
        action.__raw = "      { \"<leader>da\", function() require(\"dap\").continue({ before = get_args }) end, desc = \"Run with Args\" }";
        options.desc = "Run with Args";
      }
      {
        mode = [ "n" ];
        key = "<leader>dC";
        action.__raw = "      { \"<leader>dC\", function() require(\"dap\").run_to_cursor() end, desc = \"Run to Cursor\" }";
        options.desc = "Run to Cursor";
      }
      {
        mode = [ "n" ];
        key = "<leader>dg";
        action.__raw = "      { \"<leader>dg\", function() require(\"dap\").goto_() end, desc = \"Go to Line (No Execute)\" }";
        options.desc = "Go to Line (No Execute)";
      }
      {
        mode = [ "n" ];
        key = "<leader>di";
        action.__raw = "      { \"<leader>di\", function() require(\"dap\").step_into() end, desc = \"Step Into\" }";
        options.desc = "Step Into";
      }
      {
        mode = [ "n" ];
        key = "<leader>dj";
        action.__raw = "      { \"<leader>dj\", function() require(\"dap\").down() end, desc = \"Down\" }";
        options.desc = "Down";
      }
      {
        mode = [ "n" ];
        key = "<leader>dk";
        action.__raw = "      { \"<leader>dk\", function() require(\"dap\").up() end, desc = \"Up\" }";
        options.desc = "Up";
      }
      {
        mode = [ "n" ];
        key = "<leader>dl";
        action.__raw = "      { \"<leader>dl\", function() require(\"dap\").run_last() end, desc = \"Run Last\" }";
        options.desc = "Run Last";
      }
      {
        mode = [ "n" ];
        key = "<leader>do";
        action.__raw = "      { \"<leader>do\", function() require(\"dap\").step_out() end, desc = \"Step Out\" }";
        options.desc = "Step Out";
      }
      {
        mode = [ "n" ];
        key = "<leader>dO";
        action.__raw = "      { \"<leader>dO\", function() require(\"dap\").step_over() end, desc = \"Step Over\" }";
        options.desc = "Step Over";
      }
      {
        mode = [ "n" ];
        key = "<leader>dP";
        action.__raw = "      { \"<leader>dP\", function() require(\"dap\").pause() end, desc = \"Pause\" }";
        options.desc = "Pause";
      }
      {
        mode = [ "n" ];
        key = "<leader>dr";
        action.__raw = "      { \"<leader>dr\", function() require(\"dap\").repl.toggle() end, desc = \"Toggle REPL\" }";
        options.desc = "Toggle REPL";
      }
      {
        mode = [ "n" ];
        key = "<leader>ds";
        action.__raw = "      { \"<leader>ds\", function() require(\"dap\").session() end, desc = \"Session\" }";
        options.desc = "Session";
      }
      {
        mode = [ "n" ];
        key = "<leader>dt";
        action.__raw = "      { \"<leader>dt\", function() require(\"dap\").terminate() end, desc = \"Terminate\" }";
        options.desc = "Terminate";
      }
      {
        mode = [ "n" ];
        key = "<leader>dw";
        action.__raw = "      { \"<leader>dw\", function() require(\"dap.ui.widgets\").hover() end, desc = \"Widgets\" }";
        options.desc = "Widgets";
      }
      {
        mode = [ "n" ];
        key = "<leader>du";
        action.__raw = "      { \"<leader>du\", function() require(\"dapui\").toggle({ }) end, desc = \"Dap UI\" }";
        options.desc = "Dap UI";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>de";
        action.__raw = "      { \"<leader>de\", function() require(\"dapui\").eval() end, desc = \"Eval\", mode = {\"n\", \"x\"} }";
        options.desc = "Eval";
      }
    ];
  };
}
