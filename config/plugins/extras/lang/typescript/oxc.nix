# LazyVim extra: lang.typescript.oxc
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/typescript/oxc.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.typescript.oxc" config.extras) {

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
