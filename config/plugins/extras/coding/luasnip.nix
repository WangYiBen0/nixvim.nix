# LazyVim extra: coding.luasnip
# Port of .lazyvim-ref/lua/lazyvim/plugins/extras/coding/luasnip.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.coding or { }).luasnip or false) {
    plugins = {
      # Upstream disables the builtin snippet engine this extra replaces.
      nvim-snippets.enable = false;

      luasnip = {
        enable = true;
        settings = {
          history = true;
          delete_check_events = "TextChanged";
        };
      };

      # blink.cmp integration: expand snippets through LuaSnip instead of the
      # native `vim.snippet` engine.
      blink-cmp.settings.snippets.preset = "luasnip";
    };

    # Upstream wires friendly-snippets through LuaSnip's vscode loaders (both
    # the built-in ones and a per-config `snippets/` directory).
    extraConfigLua = ''
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })

      -- Upstream's second LuaSnip spec re-points the shared cmp actions at
      -- LuaSnip, so <Tab> jumps its placeholders instead of vim.snippet's.
      local cmp_actions = require("lazyvim.util").cmp.actions
      cmp_actions.snippet_forward = function()
        if require("luasnip").jumpable(1) then
          vim.schedule(function()
            require("luasnip").jump(1)
          end)
          return true
        end
      end
      cmp_actions.snippet_stop = function()
        if require("luasnip").expand_or_jumpable() then
          require("luasnip").unlink_current()
          return true
        end
      end
    '';
  };
}
