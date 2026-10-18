# LazyVim extra: lang.sql
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/sql.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.sql" config.extras) {
    plugins.vim-dadbod.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "sql"
    ];

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>D";
        action = "<cmd>DBUIToggle<CR>";
        options.desc = "Toggle DBUI";
      }
    ];
  };
}
