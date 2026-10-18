# LazyVim extra: lang.python
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/python.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).python or false) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "ninja"
      "rst"
    ];

    plugins = {
      lsp = {
        servers = {
          ruff.enable = true;
          ruff_lsp.enable = true;
        };
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>cv";
        action = "<cmd>:VenvSelect<cr>";
        options.desc = "Select VirtualEnv";
      }
    ];
  };
}
