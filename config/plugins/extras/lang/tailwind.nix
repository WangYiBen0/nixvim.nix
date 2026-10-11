# LazyVim extra: lang.tailwind
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/tailwind.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.tailwind" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          tailwindcss.enable = true;
          tailwindcss.settings = {
            tailwindCSS = {
              includeLanguages = {
                elixir = "html-eex";
                eelixir = "html-eex";
                heex = "html-eex";
              };
            };
          };
        };
      };
    };
  };
}
