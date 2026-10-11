# LazyVim extra: lang.json
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/json.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.json" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "json5"
    ];

    plugins = {
      lsp = {
        servers = {
          jsonls.enable = true;
          jsonls.settings = {
            json = {
              validate = {
                enable = true;
              };
              format = {
                enable = true;
              };
            };
          };
        };
      };
    };
  };
}
