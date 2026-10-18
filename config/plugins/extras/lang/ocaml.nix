# LazyVim extra: lang.ocaml
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ocaml.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.ocaml" config.extras) {

    plugins = {
      lsp = {
        servers = {
          ocamllsp.enable = true;
        };
      };
    };
  };
}
