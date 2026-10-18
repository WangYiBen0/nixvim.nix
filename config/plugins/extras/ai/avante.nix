# LazyVim extra: ai.avante
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/avante.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "ai.avante" config.extras) {
    plugins.avante.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>aa";
        action = "<cmd>AvanteAsk<CR>";
        options.desc = "Ask Avante";
      }
      {
        mode = [ "n" ];
        key = "<leader>ac";
        action = "<cmd>AvanteChat<CR>";
        options.desc = "Chat with Avante";
      }
      {
        mode = [ "n" ];
        key = "<leader>ae";
        action = "<cmd>AvanteEdit<CR>";
        options.desc = "Edit Avante";
      }
      {
        mode = [ "n" ];
        key = "<leader>af";
        action = "<cmd>AvanteFocus<CR>";
        options.desc = "Focus Avante";
      }
      {
        mode = [ "n" ];
        key = "<leader>ah";
        action = "<cmd>AvanteHistory<CR>";
        options.desc = "Avante History";
      }
      {
        mode = [ "n" ];
        key = "<leader>am";
        action = "<cmd>AvanteModels<CR>";
        options.desc = "Select Avante Model";
      }
      {
        mode = [ "n" ];
        key = "<leader>an";
        action = "<cmd>AvanteChatNew<CR>";
        options.desc = "New Avante Chat";
      }
      {
        mode = [ "n" ];
        key = "<leader>ap";
        action = "<cmd>AvanteSwitchProvider<CR>";
        options.desc = "Switch Avante Provider";
      }
      {
        mode = [ "n" ];
        key = "<leader>ar";
        action = "<cmd>AvanteRefresh<CR>";
        options.desc = "Refresh Avante";
      }
      {
        mode = [ "n" ];
        key = "<leader>as";
        action = "<cmd>AvanteStop<CR>";
        options.desc = "Stop Avante";
      }
      {
        mode = [ "n" ];
        key = "<leader>at";
        action = "<cmd>AvanteToggle<CR>";
        options.desc = "Toggle Avante";
      }
    ];
  };
}
