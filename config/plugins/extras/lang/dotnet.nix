# LazyVim extra: lang.dotnet
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/dotnet.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.dotnet" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "c_sharp"
      "fsharp"
    ];

    plugins = {
      lsp = {
        servers = {
          omnisharp.enable = true;
          fsautocomplete.enable = true;
        };
      };
    };
  };
}
