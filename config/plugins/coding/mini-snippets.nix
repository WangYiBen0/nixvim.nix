{ lib, config, ... }:
{
  # LazyVim's coding.mini-snippets extra replaces LuaSnip with mini.snippets and
  # switches blink.cmp's snippet engine to the mini_snippets preset.
  plugins = {
    # Only in the mini profile: the default profile uses LuaSnip.
    luasnip.enable = lib.mkIf config.miniProfile (lib.mkForce false);

    mini-snippets = {
      enable = lib.mkDefault config.miniProfile;
      # Upstream: `event = "InsertEnter"` — "don't depend on other plugins to load".
      lazyLoad.settings.event = [ "InsertEnter" ];

      settings = {
        # `{ mini_snippets.gen_loader.from_lang() }` — integrates with
        # friendly-snippets and language-specific snippets on the runtimepath.
        snippets = [
          {
            __raw = ''require("mini.snippets").gen_loader.from_lang()'';
          }
        ];

        expand.select.__raw = ''
          function(snippets, insert)
            -- Close the completion window on snippet select, so its virtual text
            -- is removed before `vim.ui.select` runs.
            local select = MiniSnippets.default_select
            select(snippets, insert)
          end
        '';
      };
    };

    # blink.cmp integration (`include_in_completion` branch).
    blink-cmp.settings.snippets.preset = lib.mkIf config.miniProfile "mini_snippets";
  };

  # LazyVim patches the shared cmp actions when the mini.snippets extra is on:
  # `<esc>` should not stop the session, and `<Tab>` jumps mini.snippets
  # placeholders instead of native `vim.snippet` ones.
  extraConfigLua = ''
    do
      local cmp_actions = require("lazyvim.util").cmp.actions

      cmp_actions.snippet_stop = function() end

      cmp_actions.snippet_forward = function()
        local is_active = MiniSnippets.session.get(false) ~= nil
        if is_active then
          MiniSnippets.session.jump("next")
          return true
        end
      end
    end
  '';

  # Counterpart to `<Tab>`: jump to the previous snippet placeholder.
  keymaps = [
    {
      mode = "i";
      key = "<s-tab>";
      action.__raw = ''
        function()
          local is_active = MiniSnippets.session.get(false) ~= nil
          if is_active then
            MiniSnippets.session.jump("prev")
            return true
          end
        end
      '';
      options.desc = "Jump to previous snippet placeholder";
    }
  ];
}
