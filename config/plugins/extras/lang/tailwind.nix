# LazyVim extra: lang.tailwind
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/tailwind.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.tailwind" config.extras) {

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
