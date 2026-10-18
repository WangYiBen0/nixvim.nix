# LazyVim extra: linting.eslint
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/linting/eslint.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.linting or { }).eslint or false) {

    plugins = {
      lsp = {
        servers = {
          eslint.enable = true;
          eslint.settings = {
            format = true;
            workingDirectories = {
              mode = "auto";
            };
          };
        };
      };
    };
  };
}
