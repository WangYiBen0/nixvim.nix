{
  plugins.persistence = {
    enable = true;
    lazyLoad.settings.event = [ "BufReadPre" ];
  };

  keymaps = [
    {
      key = "<leader>qs";
      action.__raw = ''function() require("persistence").load() end'';
      options.desc = "Restore Session";
    }
    {
      key = "<leader>qS";
      action.__raw = ''function() require("persistence").select() end'';
      options.desc = "Select Session";
    }
    {
      key = "<leader>ql";
      action.__raw = ''function() require("persistence").load({ last = true }) end'';
      options.desc = "Restore Last Session";
    }
    {
      key = "<leader>qd";
      action.__raw = ''function() require("persistence").stop() end'';
      options.desc = "Don't Save Current Session";
    }
  ];
}
