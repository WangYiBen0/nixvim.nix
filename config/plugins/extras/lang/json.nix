# LazyVim extra: lang.json
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/json.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).json or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "json5"
    ];

    plugins = {
      lsp = {
        servers = {
          jsonls.enable = true;
          jsonls.settings = {
            json = {
              format = {
                enable = true;
              };
              validate = {
                enable = true;
              };
            };
          };
        };
      };
    };
  };
}
