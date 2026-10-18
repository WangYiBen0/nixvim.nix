# LazyVim extra: lang.typescript.oxc
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typescript/oxc.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).typescript or false) {

    plugins = {
      lsp = {
        servers = {
          oxlint.enable = true;
          oxlint.settings = {
            fixKind = "all";
          };
          oxfmt.enable = true;
        };
      };
    };
  };
}
