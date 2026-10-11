# LazyVim extra: lang.helm
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/helm.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.helm" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
