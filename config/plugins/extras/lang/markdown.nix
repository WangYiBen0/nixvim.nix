# LazyVim extra: lang.markdown
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/markdown.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.markdown" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          marksman.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          markdown = [ "markdownlint-cli2" ];
        };
      };
    };
  };
}
