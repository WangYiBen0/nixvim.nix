# LazyVim extra: lang.nix
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/nix.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.nix" config.lazyvim.extras) {

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "nix"
    ];

    plugins = {
      lsp = {
        servers = {
          nil_ls.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          nix = [ "statix" ];
        };
      };
    };
  };
}
