# LazyVim extra: lang.ruby
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ruby.lua
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
          standardrb.enable = true;
          ruby_lsp.enable = true;
          solargraph.enable = true;
          rubocop.enable = true;
        };
      };
    };
  };
}
