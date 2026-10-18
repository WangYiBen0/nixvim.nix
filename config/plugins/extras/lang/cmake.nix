# LazyVim extra: lang.cmake
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/cmake.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).cmake or false) {
    plugins.cmake-tools.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "cmake"
    ];

    plugins = {
      lsp = {
        servers = {
          neocmake.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          cmake = [ "cmakelint" ];
        };
      };
    };
  };
}
