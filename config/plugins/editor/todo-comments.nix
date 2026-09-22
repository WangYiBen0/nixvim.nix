{
  plugins.todo-comments = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
      "BufWritePre"
    ];
  };

  keymaps = [
    {
      key = "]t";
      action.__raw = ''function() require("todo-comments").jump_next() end'';
      options.desc = "Next Todo Comment";
    }
    {
      key = "[t";
      action.__raw = ''function() require("todo-comments").jump_prev() end'';
      options.desc = "Previous Todo Comment";
    }
    {
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
      options.desc = "Todo (Trouble)";
    }
    {
      key = "<leader>xT";
      action = "<cmd>Trouble todo toggle filter = {tag = {TODO;FIX;FIXME}}<cr>";
      options.desc = "Todo/Fix/Fixme (Trouble)";
    }
    {
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options.desc = "Todo";
    }
    {
      key = "<leader>sT";
      action = "<cmd>TodoTelescope keywords=TODO;FIX;FIXME<cr>";
      options.desc = "Todo/Fix/Fixme";
    }
  ];
}
