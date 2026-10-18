# LazyVim extra: lang.docker
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/docker.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).docker or false) {

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
