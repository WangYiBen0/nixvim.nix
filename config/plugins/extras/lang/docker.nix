# LazyVim extra: lang.docker
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/docker.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.docker" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
