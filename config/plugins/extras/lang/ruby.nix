# LazyVim extra: lang.ruby
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ruby.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.ruby" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "ruby"
    ];

    plugins = {
      lsp = {
        servers = {
          ruby_lsp.enable = true;
          solargraph.enable = true;
          rubocop.enable = true;
          standardrb.enable = true;
        };
      };
    };
  };
}
