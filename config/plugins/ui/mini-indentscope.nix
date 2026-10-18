{ lib, config, ... }:
{
  plugins.mini-indentscope = {
    enable = lib.mkDefault config.miniProfile;
    # Upstream uses `LazyFile`, a lazy.nvim pseudo-event. Its real equivalent is
    # exactly these three file events — deliberately NOT DeferredUIEnter, so the
    # indent scope does not load on the mini.starter start screen and draw there.
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
      "BufWritePre"
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
  plugins.snacks.settings.indent.scope.enabled = lib.mkIf config.miniProfile (lib.mkForce false);
}
