{ lib, config, ... }:
let
  registry = import ./plugins/extras/registry.nix;

  # Flatten the nested attrset into "dotted.name" -> bool.
  flatExtras = lib.concatMapAttrs (
    k: v: if lib.isBool v then { "${k}" = v; } else lib.mapAttrs' (k2: lib.nameValuePair "${k}.${k2}") v
  ) config.extras;

  enabled = lib.attrNames (lib.filterAttrs (_: v: v) flatExtras);
  unported = lib.filter (n: !(registry.${n} or false)) enabled;
in
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

    # Optional feature modules. Disabled by default: the base configuration
    # already provides its own feature set, so enabling one here is purely
    # additive. Names follow the catalog in
    # config/plugins/extras/registry.nix (dotted, e.g. `lang.go`); only names
    # marked `true` there have a static port, anything else warns and does
    # nothing.
    extras = lib.mkOption {
      type = with lib.types; attrsOf (either bool (attrsOf bool));
      default = { };
      description = "Optional feature modules to enable, keyed by name.";
      example = {
        lang.go = true;
      };
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

  config = {
    warnings = map (
      n:
      "feature module '${n}' is enabled but has no static port, so it does nothing (see config/plugins/extras/registry.nix)"
    ) unported;
  };
}
