# LazyVim extra: lang.tex
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/tex.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.tex" config.lazyvim.extras) {
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
