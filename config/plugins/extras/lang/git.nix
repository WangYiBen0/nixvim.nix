# LazyVim extra: lang.git
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/git.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.git" config.extras) {

    # treesitter parsers
    extraTreesitterParsers = [
      "git_config"
      "git_rebase"
      "gitattributes"
      "gitcommit"
      "gitignore"
    ];
  };
}
