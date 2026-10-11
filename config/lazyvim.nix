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

    # LazyVim extras, using the same dotted names as `:LazyExtras`
    # (e.g. [ "lang.go" "editor.mini-files" ]).
    # See config/plugins/extras/registry.nix for the full catalog and which ones
    # have a static port.
    extras = lib.mkOption {
      type = with lib.types; listOf str;
      default = [
        "lang.docker"
        "lang.erlang"
      ];
      description = ''
        LazyVim extras to enable. Names match upstream's `:LazyExtras` list
        (dotted, e.g. `"lang.go"`). Only extras marked `true` in
        `config/plugins/extras/registry.nix` have a static port; enabling an
        unported one produces a warning.
      '';
      example = [
        "lang.go"
        "lang.docker"
      ];
    };

    # Treesitter parsers contributed by enabled extras. `types.listOf` merges by
    # concatenation, so several extras can each contribute parsers without
    # conflicting; treesitter.nix appends them to its base list.
    extraTreesitterParsers = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      internal = true;
      description = "Treesitter parsers contributed by enabled LazyVim extras.";
    };
  };
}
