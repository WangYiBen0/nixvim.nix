# LazyVim extra: lang.terraform
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/terraform.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.terraform" config.extras) {

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
