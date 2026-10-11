{ lib, ... }:
let
  # Upstream: `local pad = string.rep(" ", 22)`
  pad = lib.strings.concatStrings (lib.lists.replicate 22 " ");
in
{
  # LazyVim's ui.mini-starter extra disables the Snacks dashboard and replaces
  # it with mini.starter (user-approved: this intentionally supersedes the
  # customised Snacks dashboard in config/plugins/util/snacks.nix).
  # mkForce because snacks.nix enables the dashboard unconditionally.
  plugins.snacks.settings.dashboard.enabled = lib.mkForce false;

  plugins.mini-starter = {
    enable = true;
    lazyLoad.settings.event = [ "VimEnter" ];

    settings = {
      evaluate_single = true;

      header.__raw = ''
        table.concat({
          "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
          "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
          "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
          "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
          "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
          "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
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
        # NOTE: upstream's "Lazy Extras" (`:LazyExtras`) and "Lazy" (`:Lazy`)
        # items are not portable to this static port: lazy.nvim is deliberately
        # not implemented, so there is no extras UI to open.
        {
          name = "Quit";
          action = "qa";
          section = "${pad}Built-in";
        }
      ];

      content_hooks = [
        {
          __raw = ''require("mini.starter").gen_hook.adding_bullet("${pad}░ ", false)'';
        }
        {
          __raw = ''require("mini.starter").gen_hook.aligning("center", "center")'';
        }
      ];
    };
  };
}
