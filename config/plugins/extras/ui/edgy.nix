# LazyVim extra: ui.edgy
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ui/edgy.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "ui.edgy" config.lazyvim.extras) {
    plugins.edgy.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>ue";
        action.__raw = "        function()
          require(\"edgy\").toggle()
        end";
        options.desc = "Edgy Toggle";
      }
      {
        mode = [ "n" ];
        key = "<leader>uE";
        action.__raw = "      { \"<leader>uE\", function() require(\"edgy\").select() end, desc = \"Edgy Select Window\" }";
        options.desc = "Edgy Select Window";
      }
    ];
  };
}
