# LazyVim extra: lang.helm
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/helm.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).helm or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "helm"
    ];

    plugins = {
      lsp = {
        servers = {
          helm_ls.enable = true;
        };
      };
    };
  };
}
