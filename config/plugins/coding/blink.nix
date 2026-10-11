{ lib, ... }:
{
  plugins = {
    blink-cmp = {
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];

      settings = {
        # The mini.snippets extra switches this to `preset = "mini_snippets"`
        # (see mini-snippets.nix); the `default` preset routes expansion through
        # `LazyVim.cmp.expand` (native `vim.snippet`).
        snippets.preset = lib.mkDefault "default";

        appearance = {
          # sets the fallback highlight groups to nvim-cmp's highlight groups
          use_nvim_cmp_as_default = false;
          # 'mono' for Nerd Font Mono, 'normal' for Nerd Font
          nerd_font_variant = "mono";
          # LazyVim merges `LazyVim.config.icons.kinds` into blink's kind icons
          kind_icons.__raw = "LazyVim.config.icons.kinds";
        };

        completion = {
          accept = {
            # experimental auto-brackets support
            auto_brackets.enabled = true;
          };
          menu.draw.treesitter = [ "lsp" ];
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
          };
          # `vim.g.ai_cmp` is set in config/options.nix
          ghost_text.enabled.__raw = "vim.g.ai_cmp";
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          # lazydev (LazyVim's coding.blink extra)
          # Upstream: `lua = { inherit_defaults = true, "lazydev" }` — a mixed
          # table, so it has to be emitted as raw Lua.
          per_filetype.lua.__raw = ''
            { inherit_defaults = true, "lazydev" }
          '';
          providers.lazydev = {
            name = "LazyDev";
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };

        cmdline = {
          enabled = true;
          keymap = {
            preset = "cmdline";
            "<Right>" = false;
            "<Left>" = false;
          };
          completion = {
            list.selection.preselect = false;
            menu.auto_show.__raw = ''
              function(ctx)
                return vim.fn.getcmdtype() == ":"
              end
            '';
            ghost_text.enabled = true;
          };
        };

        keymap = {
          preset = "enter";
          "<C-y>" = [ "select_and_accept" ];
          "<Tab>" = [
            {
              __raw = ''require("lazyvim.util").cmp.map({ "snippet_forward", "ai_nes", "ai_accept" })'';
            }
            "fallback"
          ];
        };
      };
    };

    blink-compat.enable = true;
    blink-emoji.enable = true;
    blink-pairs.enable = true;

    friendly-snippets.enable = true;
    luasnip.enable = true;
  };
}
