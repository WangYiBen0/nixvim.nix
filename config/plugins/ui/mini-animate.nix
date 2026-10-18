{ lib, config, ... }:
{
  # Disable the snacks scroll animation when mini.animate is enabled.
  # mkForce because snacks.nix enables it unconditionally.
  plugins.snacks.settings.scroll.enabled = lib.mkIf config.miniProfile (lib.mkForce false);

  plugins.mini-animate = {
    enable = lib.mkDefault config.miniProfile;
    # Upstream uses `cond = vim.g.neovide == nil` plus `event = "VeryLazy"`.
    # lz.n does not implement `VeryLazy`, and `lazyLoad.settings.cond` support
    # is not guaranteed, so only the event is ported here.
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
    settings = {
      resize.timing.__raw = ''
        require("mini.animate").gen_timing.linear({ duration = 50, unit = "total" })
      '';
      scroll = {
        timing.__raw = ''
          require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" })
        '';
        subscroll.__raw = ''
          require("mini.animate").gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          })
        '';
      };
    };
  };

  keymaps = [
    # don't use animate when scrolling with the mouse
    {
      mode = [
        ""
        "i"
      ];
      key = "<ScrollWheelUp>";
      action.__raw = ''
        function()
          mouse_scrolled = true
          return "<ScrollWheelUp>"
        end
      '';
      options.expr = true;
    }
    {
      mode = [
        ""
        "i"
      ];
      key = "<ScrollWheelDown>";
      action.__raw = ''
        function()
          mouse_scrolled = true
          return "<ScrollWheelDown>"
        end
      '';
      options.expr = true;
    }
    {
      mode = "n";
      key = "<leader>ua";
      action.__raw = ''
        function()
          Snacks.toggle({
            name = "Mini Animate",
            get = function()
              return not vim.g.minianimate_disable
            end,
            set = function(state)
              vim.g.minianimate_disable = not state
            end,
          }):toggle()
        end
      '';
      options.desc = "Toggle Animations";
    }
  ];

  autoCmd = [
    {
      event = "FileType";
      pattern = "grug-far";
      callback.__raw = ''
        function()
          vim.b.minianimate_disable = true
        end
      '';
    }
  ];

  # `mouse_scrolled` is an upvalue shared by the scroll-wheel expr maps and the
  # mini.animate `subscroll` predicate above; declare it before either runs.
  extraConfigLua = ''
    mouse_scrolled = false
  '';
}
