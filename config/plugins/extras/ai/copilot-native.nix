# LazyVim extra: ai.copilot-native
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/copilot-native.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.ai or { }).copilot-native or false) {

    plugins = {
      lsp = {
        servers = {
          copilot.enable = true;
        };
      };
    };
  };
}
