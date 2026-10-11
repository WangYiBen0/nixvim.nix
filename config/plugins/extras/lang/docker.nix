# LazyVim extra: lang.docker
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/docker.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.docker" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "dockerfile"
    ];

    plugins = {
      lsp = {
        servers = {
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          dockerfile = [ "hadolint" ];
        };
      };
    };
  };
}
