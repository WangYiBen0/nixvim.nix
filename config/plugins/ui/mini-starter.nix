{ lib, config, ... }:
let
  # Upstream: `local pad = string.rep(" ", 22)`
  pad = lib.strings.concatStrings (lib.lists.replicate 22 " ");
in
{
  # LazyVim's ui.mini-starter extra disables the Snacks dashboard and replaces
  # it with mini.starter. Gated on `miniProfile` so the default profile
  # keeps the customised Snacks dashboard.
  plugins.snacks.settings.dashboard.enabled = lib.mkIf config.miniProfile (lib.mkForce false);

  plugins.mini-starter = {
    enable = lib.mkDefault config.miniProfile;
    lazyLoad.settings.event = [ "VimEnter" ];

    settings = {
      evaluate_single = true;

      # The user's NIXVIM banner, byte-identical to the one the Snacks dashboard
      # uses in config/plugins/util/snacks.nix. Emitted as Lua table fields, so
      # the commas below are Lua (not Nix) separators.
      header.__raw = ''
        table.concat({
          "███╗   ██╗ ██╗ ██╗  ██╗    ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║ ██║ ╚██╗██╔╝    ██║   ██║██║████╗ ████║",
          "██╔██╗ ██║ ██║  ╚███╔╝     ██║   ██║██║██╔████╔██║",
          "██║╚██╗██║ ██║  ██╔██╗     ╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║ ██║ ██╔╝ ██╗     ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝ ╚═╝ ╚═╝  ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }, "\n")
      '';

      items = [
        {
          name = "Find file";
          action.__raw = "LazyVim.pick()";
          section = "${pad}Telescope";
        }
        {
          name = "New file";
          action = "ene | startinsert";
          section = "${pad}Built-in";
        }
        {
          name = "Recent files";
          action.__raw = "LazyVim.pick(\"oldfiles\")";
          section = "${pad}Telescope";
        }
        {
          name = "Find text";
          action.__raw = "LazyVim.pick(\"live_grep\")";
          section = "${pad}Telescope";
        }
        {
          name = "Config";
          action.__raw = "LazyVim.pick.config_files()";
          section = "${pad}Config";
        }
        {
          name = "Restore session";
          action = "lua require('persistence').load()";
          section = "${pad}Session";
        }
        {
          name = "Quit";
          action = "qa";
          section = "${pad}Built-in";
        }
        # NOTE: upstream also has "Lazy Extras" (`:LazyExtras`) and "Lazy"
        # (`:Lazy`) items. lazy.nvim is deliberately not part of this static
        # port, so there is no extras UI to open and they are omitted.
      ];

      content_hooks = [
        {
          __raw = ''require("mini.starter").gen_hook.adding_bullet("${pad}░ ", false)'';
        }
        {
          __raw = ''require("mini.starter").gen_hook.aligning("center", "center")'';
        }
      ];

      # Upstream shows "⚡ Neovim loaded N plugins in Xms" from lazy.nvim's
      # stats. lazy.nvim is not part of this static port, so the plugin count is
      # derived from the runtimepath pack dirs instead, and the startup-ms figure
      # (only lazy.nvim knows it) is omitted.
      footer.__raw = ''
        function()
          local count = 0
          for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
            if rtp:match("/pack/%w+/start/[^/]+$") or rtp:match("/pack/%w+/opt/[^/]+$") then
              count = count + 1
            end
          end
          return string.rep(" ", 8) .. "⚡ Neovim loaded " .. count .. " plugins"
        end
      '';
    };
  };
}
