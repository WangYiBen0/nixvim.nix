# LazyVim extra: lang.dotnet
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dotnet.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.dotnet" config.lazyvim.extras) {
    plugins.neotest.enable = true;

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "c_sharp"
      "fsharp"
    ];

    plugins = {
      lsp = {
        servers = {
          fsautocomplete.enable = true;
          omnisharp.enable = true;
        };
      };
    };
  };
}
