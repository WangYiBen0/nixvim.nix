# LazyVim extra: lang.tailwind
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/tailwind.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).tailwind or false) {

    plugins = {
      lsp = {
        servers = {
          tailwindcss.enable = true;
          tailwindcss.settings = {
            tailwindCSS = {
              includeLanguages = {
                heex = "html-eex";
                elixir = "html-eex";
                eelixir = "html-eex";
              };
            };
          };
        };
      };
    };
  };
}
