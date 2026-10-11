# LazyVim extra: lang.ansible
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ansible.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.ansible" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          ansiblels.enable = true;
        };
      };
    };
  };
}
