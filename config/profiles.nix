{ lib, ... }:
{
  options = {
    # Editor profile switch.
    #
    #   false (default) = the default profile:
    #     Snacks dashboard (customised banner + labels), gitsigns.nvim, LuaSnip,
    #     snacks scroll/indent scope, ts-comments.
    #
    #   true            = the mini profile, whose mini.* modules replace the
    #     defaults wherever they overlap: mini.starter, mini.diff,
    #     mini.snippets, mini.animate, mini.indentscope, mini.comment.
    miniProfile = lib.mkEnableOption "the mini profile (mini.* modules replace the defaults)";

    # Optional feature modules, using dotted names (e.g. [ "lang.go" ]).
    # See config/plugins/extras/registry.nix for the full catalog and which
    # ones have a static port.
    extras = lib.mkOption {
      type = with lib.types; listOf str;
      default = [
        "lang.clangd"
        "util.dot"
      ];
      description = ''
        Feature modules to enable, by dotted name. Only names marked `true` in
        `config/plugins/extras/registry.nix` have a static port; enabling an
        unported one produces a warning. The default lists the modules whose
        functionality the base configuration already provides.
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
      description = "Treesitter parsers contributed by enabled feature modules.";
    };
  };
}
