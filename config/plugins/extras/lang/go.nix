# LazyVim extra: lang.go
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/go.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.go" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
              directoryFilters = [
                "-.git"
                "-.vscode"
                "-.idea"
                "-.vscode-test"
                "-node_modules"
              ];
              gofumpt = true;
              analyses = {
                unusedparams = true;
                unusedwrite = true;
                useany = true;
                nilness = true;
              };
              codelenses = {
                upgrade_dependency = true;
                vendor = true;
                generate = true;
                gc_details = false;
                regenerate_cgo = true;
                run_govulncheck = true;
                test = true;
                tidy = true;
              };
              hints = {
                parameterNames = true;
                rangeVariableTypes = true;
                assignVariableTypes = true;
                compositeLiteralFields = true;
                compositeLiteralTypes = true;
                constantValues = true;
                functionTypeParameters = true;
              };
              usePlaceholders = true;
              completeUnimported = true;
              staticcheck = true;
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
