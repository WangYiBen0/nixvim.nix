# LazyVim extra: coding.luasnip
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/coding/luasnip.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "coding.luasnip" config.lazyvim.extras) {
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
