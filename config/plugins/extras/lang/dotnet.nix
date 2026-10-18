# LazyVim extra: lang.dotnet
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dotnet.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).dotnet or false) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
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
