# LazyVim extra: ai.copilot-native
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/copilot-native.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "ai.copilot-native" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          copilot.enable = true;
        };
      };
    };
  };
}
