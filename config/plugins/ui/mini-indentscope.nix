{ lib, ... }:
{
  plugins.mini-indentscope = {
    enable = true;
    # Upstream uses `LazyFile`, a lazy.nvim pseudo-event. This repo's equivalent
    # (see treesitter.nix) is the set of real file events plus DeferredUIEnter.
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
      "BufWritePre"
      "DeferredUIEnter"
    ];
    settings = {
      # symbol = "▏",
      symbol = "│";
      options.try_as_border = true;
    };
  };

  autoCmd = [
    {
      event = "FileType";
      pattern = [
        "Trouble"
        "alpha"
        "dashboard"
        "fzf"
        "help"
        "lazy"
        "mason"
        "neo-tree"
        "notify"
        "sidekick_terminal"
        "snacks_dashboard"
        "snacks_notif"
        "snacks_terminal"
        "snacks_win"
        "toggleterm"
        "trouble"
      ];
      callback.__raw = ''
        function()
          vim.b.miniindentscope_disable = true
        end
      '';
    }
    {
      event = "User";
      pattern = "SnacksDashboardOpened";
      callback.__raw = ''
        function(data)
          vim.b[data.buf].miniindentscope_disable = true
        end
      '';
    }
  ];

  # mkForce because snacks.nix enables the indent scope unconditionally.
  plugins.snacks.settings.indent.scope.enabled = lib.mkForce false;
}
