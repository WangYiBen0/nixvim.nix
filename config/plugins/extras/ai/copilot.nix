# LazyVim extra: ai.copilot
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/copilot.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.ai or { }).copilot or false) {

    plugins = {
      lsp = {
        servers = {
          copilot.enable = true;
        };
      };
    };
  };
}
