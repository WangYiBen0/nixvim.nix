# LazyVim extra: lang.cmake
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/cmake.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.cmake" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
