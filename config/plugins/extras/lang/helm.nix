# LazyVim extra: lang.helm
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/helm.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.helm" config.extras) {

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
