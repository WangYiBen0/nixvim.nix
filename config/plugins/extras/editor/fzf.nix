# LazyVim extra: editor.fzf
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/fzf.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.editor or { }).fzf or false) {
    plugins.fzf-lua.enable = true;

    keymaps = [
      {
        mode = [ "t" ];
        key = "<c-j>";
        action = "<c-j>";
      }
      {
        mode = [ "t" ];
        key = "<c-k>";
        action = "<c-k>";
      }
      {
        mode = [ "n" ];
        key = "<leader>,";
        action = "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>";
        options.desc = "Switch Buffer";
      }
      {
        mode = [ "n" ];
        key = "<leader>:";
        action = "<cmd>FzfLua command_history<cr>";
        options.desc = "Command History";
      }
      {
        mode = [ "n" ];
        key = "<leader>fb";
        action = "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>";
        options.desc = "Buffers";
      }
      {
        mode = [ "n" ];
        key = "<leader>fB";
        action = "<cmd>FzfLua buffers<cr>";
        options.desc = "Buffers (all)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fg";
        action = "<cmd>FzfLua git_files<cr>";
        options.desc = "Find Files (git-files)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fr";
        action = "<cmd>FzfLua oldfiles<cr>";
        options.desc = "Recent";
      }
      {
        mode = [ "n" ];
        key = "<leader>gc";
        action = "<cmd>FzfLua git_commits<CR>";
        options.desc = "Commits";
      }
      {
        mode = [ "n" ];
        key = "<leader>gd";
        action = "<cmd>FzfLua git_diff<cr>";
        options.desc = "Git Diff (files)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gl";
        action = "<cmd>FzfLua git_commits<CR>";
        options.desc = "Commits";
      }
      {
        mode = [ "n" ];
        key = "<leader>gs";
        action = "<cmd>FzfLua git_status<CR>";
        options.desc = "Status";
      }
      {
        mode = [ "n" ];
        key = "<leader>gS";
        action = "<cmd>FzfLua git_stash<cr>";
        options.desc = "Git Stash";
      }
      {
        mode = [ "n" ];
        key = "<leader>s\"";
        action = "<cmd>FzfLua registers<cr>";
        options.desc = "Registers";
      }
      {
        mode = [ "n" ];
        key = "<leader>s/";
        action = "<cmd>FzfLua search_history<cr>";
        options.desc = "Search History";
      }
      {
        mode = [ "n" ];
        key = "<leader>sa";
        action = "<cmd>FzfLua autocmds<cr>";
        options.desc = "Auto Commands";
      }
      {
        mode = [ "n" ];
        key = "<leader>sb";
        action = "<cmd>FzfLua lines<cr>";
        options.desc = "Buffer Lines";
      }
      {
        mode = [ "n" ];
        key = "<leader>sc";
        action = "<cmd>FzfLua command_history<cr>";
        options.desc = "Command History";
      }
      {
        mode = [ "n" ];
        key = "<leader>sC";
        action = "<cmd>FzfLua commands<cr>";
        options.desc = "Commands";
      }
      {
        mode = [ "n" ];
        key = "<leader>sd";
        action = "<cmd>FzfLua diagnostics_workspace<cr>";
        options.desc = "Diagnostics";
      }
      {
        mode = [ "n" ];
        key = "<leader>sD";
        action = "<cmd>FzfLua diagnostics_document<cr>";
        options.desc = "Buffer Diagnostics";
      }
      {
        mode = [ "n" ];
        key = "<leader>sh";
        action = "<cmd>FzfLua help_tags<cr>";
        options.desc = "Help Pages";
      }
      {
        mode = [ "n" ];
        key = "<leader>sH";
        action = "<cmd>FzfLua highlights<cr>";
        options.desc = "Search Highlight Groups";
      }
      {
        mode = [ "n" ];
        key = "<leader>sj";
        action = "<cmd>FzfLua jumps<cr>";
        options.desc = "Jumplist";
      }
      {
        mode = [ "n" ];
        key = "<leader>sk";
        action = "<cmd>FzfLua keymaps<cr>";
        options.desc = "Key Maps";
      }
      {
        mode = [ "n" ];
        key = "<leader>sl";
        action = "<cmd>FzfLua loclist<cr>";
        options.desc = "Location List";
      }
      {
        mode = [ "n" ];
        key = "<leader>sM";
        action = "<cmd>FzfLua man_pages<cr>";
        options.desc = "Man Pages";
      }
      {
        mode = [ "n" ];
        key = "<leader>sm";
        action = "<cmd>FzfLua marks<cr>";
        options.desc = "Jump to Mark";
      }
      {
        mode = [ "n" ];
        key = "<leader>sR";
        action = "<cmd>FzfLua resume<cr>";
        options.desc = "Resume";
      }
      {
        mode = [ "n" ];
        key = "<leader>sq";
        action = "<cmd>FzfLua quickfix<cr>";
        options.desc = "Quickfix List";
      }
      {
        mode = [ "n" ];
        key = "<leader>ss";
        action.__raw = "        function()
          require(\"fzf-lua\").lsp_document_symbols({
            regex_filter = symbols_filter,
          })
        end";
        options.desc = "Goto Symbol";
      }
      {
        mode = [ "n" ];
        key = "<leader>sS";
        action.__raw = "        function()
          require(\"fzf-lua\").lsp_live_workspace_symbols({
            regex_filter = symbols_filter,
          })
        end";
        options.desc = "Goto Symbol (Workspace)";
      }
      {
        mode = [ "n" ];
        key = "<leader>st";
        action.__raw = "      { \"<leader>st\", function() require(\"todo-comments.fzf\").todo() end, desc = \"Todo\" }";
        options.desc = "Todo";
      }
      {
        mode = [ "n" ];
        key = "<leader>sT";
        action.__raw = "      { \"<leader>sT\", function () require(\"todo-comments.fzf\").todo({ keywords = { \"TODO\", \"FIX\", \"FIXME\" } }) end, desc = \"Todo/Fix/Fixme\" }";
        options.desc = "Todo/Fix/Fixme";
      }
    ];
  };
}
