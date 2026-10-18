# LazyVim extra: lang.nix
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/nix.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).nix or false) {

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
