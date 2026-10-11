# LazyVim extra: ai.copilot
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/copilot.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "ai.copilot" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          copilot.enable = true;
        };
      };
    };
  };
}
