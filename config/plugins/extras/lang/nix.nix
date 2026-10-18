# LazyVim extra: lang.nix
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/nix.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.nix" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
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
