{ lib, config, ... }:
{
  # LazyVim's editor.mini-diff extra replaces gitsigns.nvim with mini.diff.
  # mkForce because gitsigns.nix enables it unconditionally.
  plugins.gitsigns.enable = lib.mkIf config.lazyvim.miniProfile (lib.mkForce false);
  plugins.mini-diff = {
    enable = config.lazyvim.miniProfile;
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
    settings = {
      view = {
        style = "sign";
        signs = {
          add = "▎";
          change = "▎";
          delete = "";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      action.__raw = ''
        function()
          require("mini.diff").toggle_overlay(0)
        end
      '';
      options.desc = "Toggle mini.diff overlay";
    }
    {
      mode = "n";
      key = "<leader>uG";
      action.__raw = ''
        function()
          Snacks.toggle({
            name = "Mini Diff Signs",
            get = function()
              return vim.g.minidiff_disable ~= true
            end,
            set = function(state)
              vim.g.minidiff_disable = not state
              if state then
                require("mini.diff").enable(0)
              else
                require("mini.diff").disable(0)
              end
              -- HACK: redraw to update the signs
              vim.defer_fn(function()
                vim.cmd([[redraw!]])
              end, 200)
            end,
          }):toggle()
        end
      '';
      options.desc = "Toggle Mini Diff Signs";
    }
  ];
}
