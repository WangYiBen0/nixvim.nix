# LazyVim extra: linting.eslint
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/linting/eslint.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "linting.eslint" config.extras) {

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
