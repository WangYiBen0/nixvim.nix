# LazyVim extra: lang.clangd
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/clangd.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.clangd" config.extras) {

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
