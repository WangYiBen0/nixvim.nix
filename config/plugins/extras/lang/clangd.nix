# LazyVim extra: lang.clangd
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/clangd.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).clangd or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "cpp"
    ];

    plugins = {
      lsp = {
        servers = {
          clangd.enable = true;
        };
      };
    };
  };
}
