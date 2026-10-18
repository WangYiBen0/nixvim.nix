# LazyVim extra: lang.rego
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/rego.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).rego or false) {

    # treesitter parsers
    extraTreesitterParsers = [
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
