# LazyVim extra: lang.haskell
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/haskell.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.haskell" config.extras) {
    plugins.haskell-tools.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "haskell"
    ];

    plugins = {
      lint = {
        lintersByFt = {
          haskell = [ "hlint" ];
        };
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<localleader>e";
        action = "<cmd>HlsEvalAll<cr>";
        options.desc = "Evaluate All";
      }
      {
        mode = [ "n" ];
        key = "<localleader>h";
        action.__raw = "        function()
          require(\"haskell-tools\").hoogle.hoogle_signature()
        end";
        options.desc = "Hoogle Signature";
      }
      {
        mode = [ "n" ];
        key = "<localleader>r";
        action.__raw = "        function()
          require(\"haskell-tools\").repl.toggle()
        end";
        options.desc = "REPL (Package)";
      }
      {
        mode = [ "n" ];
        key = "<localleader>R";
        action.__raw = "        function()
          require(\"haskell-tools\").repl.toggle(vim.api.nvim_buf_get_name(0))
        end";
        options.desc = "REPL (Buffer)";
      }
    ];
  };
}
