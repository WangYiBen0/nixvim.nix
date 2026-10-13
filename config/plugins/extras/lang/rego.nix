# LazyVim extra: lang.rego
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/rego.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.rego" config.lazyvim.extras) {

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "rego"
    ];

    plugins = {
      lsp = {
        servers = {
          regols.enable = true;
          regal.enable = true;
        };
      };
    };
  };
}
