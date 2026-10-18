# LazyVim extra: lang.terraform
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/terraform.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).terraform or false) {

    # treesitter parsers
    extraTreesitterParsers = [
      "hcl"
      "terraform"
    ];

    plugins = {
      lsp = {
        servers = {
          terraformls.enable = true;
        };
      };
      lint = {
        lintersByFt = {
          tf = [ "terraform_validate" ];
          terraform = [ "terraform_validate" ];
        };
      };
    };
  };
}
