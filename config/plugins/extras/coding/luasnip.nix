# LazyVim extra: coding.luasnip
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/coding/luasnip.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.coding or { }).luasnip or false) {
    plugins.nvim-snippets.enable = true;

    keymaps = [
      {
        mode = [ "s" ];
        key = "<tab>";
        action.__raw = "      { \"<tab>\", function() require(\"luasnip\").jump(1) end, mode = \"s\" }";
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<s-tab>";
        action.__raw = "      { \"<s-tab>\", function() require(\"luasnip\").jump(-1) end, mode = { \"i\", \"s\" } }";
      }
    ];
  };
}
