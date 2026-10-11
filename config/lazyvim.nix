{ lib, ... }:
{
  options.lazyvim = {
    # Profile switch, exposed so the two LazyVim profiles can be flipped without
    # editing plugin modules.
    #
    #   false (default) = LazyVim's *default* profile:
    #     Snacks dashboard (with the customised NIXVIM banner + Chinese labels),
    #     gitsigns.nvim, LuaSnip, snacks scroll/indent scope, ts-comments.
    #
    #   true            = LazyVim's *mini* profile, whose extras replace the
    #     default implementations wherever they overlap:
    #     mini.starter, mini.diff, mini.snippets, mini.animate, mini.indentscope,
    #     mini.comment (plus the purely additive mini.files / mini.move /
    #     mini.hipatterns, which stay on in both profiles).
    miniProfile = lib.mkEnableOption "the LazyVim mini profile (mini.* extras replace the defaults)";
  };
}
