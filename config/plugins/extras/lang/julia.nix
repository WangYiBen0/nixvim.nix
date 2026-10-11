# LazyVim extra: lang.julia
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/julia.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.julia" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
