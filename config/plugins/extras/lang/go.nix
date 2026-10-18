# LazyVim extra: lang.go
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/go.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.go" config.extras) {
    plugins.neotest.enable = true;

    # treesitter parsers
    extraTreesitterParsers = [
      "go"
      "gomod"
      "gosum"
      "gowork"
    ];

    plugins = {
      lsp = {
        servers = {
          gopls.enable = true;
          gopls.settings = {
            gopls = {
              gofumpt = true;
              codelenses = {
                vendor = true;
                generate = true;
                gc_details = false;
                regenerate_cgo = true;
                run_govulncheck = true;
                test = true;
                tidy = true;
                upgrade_dependency = true;
              };
              analyses = {
                unusedwrite = true;
                useany = true;
                nilness = true;
                unusedparams = true;
              };
              usePlaceholders = true;
              completeUnimported = true;
              hints = {
                rangeVariableTypes = true;
                assignVariableTypes = true;
                compositeLiteralFields = true;
                compositeLiteralTypes = true;
                constantValues = true;
                functionTypeParameters = true;
                parameterNames = true;
              };
              staticcheck = true;
              directoryFilters = [
                "-.git"
                "-.vscode"
                "-.idea"
                "-.vscode-test"
                "-node_modules"
              ];
            };
          };
        };
      };
      lint = {
        lintersByFt = {
          go = [ "golangcilint" ];
        };
      };
    };
  };
}
