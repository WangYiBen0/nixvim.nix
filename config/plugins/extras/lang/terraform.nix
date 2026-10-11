# LazyVim extra: lang.terraform
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/terraform.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.terraform" config.lazyvim.extras) {
    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
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
          terraform = [ "terraform_validate" ];
          tf = [ "terraform_validate" ];
        };
      };
    };
  };
}
