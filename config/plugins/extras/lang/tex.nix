# LazyVim extra: lang.tex
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/tex.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).tex or false) {
    plugins.vimtex.enable = true;

    plugins = {
      lsp = {
        servers = {
          texlab.enable = true;
        };
      };
    };
  };
}
