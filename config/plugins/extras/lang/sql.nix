# LazyVim extra: lang.sql
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/sql.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.sql" config.lazyvim.extras) {
    plugins.vim-dadbod.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
