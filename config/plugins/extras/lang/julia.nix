# LazyVim extra: lang.julia
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/julia.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).julia or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "julia"
    ];

    plugins = {
      lsp = {
        servers = {
          julials.enable = true;
          julials.settings = {
            julia = {
              lint = {
                missingrefs = "none";
              };
              completionmode = "qualify";
            };
          };
        };
      };
    };
  };
}
