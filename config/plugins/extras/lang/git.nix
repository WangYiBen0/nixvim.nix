# LazyVim extra: lang.git
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/git.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).git or false) {

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
