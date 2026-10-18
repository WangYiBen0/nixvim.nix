# LazyVim extra: ai.copilot
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/copilot.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "ai.copilot" config.extras) {

    plugins = {
      lsp = {
        servers = {
          copilot.enable = true;
        };
      };
    };
  };
}
