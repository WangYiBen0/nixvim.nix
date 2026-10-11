# LazyVim extra: lang.terraform
# Ported from .lazyvim-ref/lua/lazyvim/plugins/extras/lang/terraform.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.terraform" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "terraform"
      "hcl"
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
