# LazyVim extra: ai.copilot-chat
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/copilot-chat.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "ai.copilot-chat" config.extras) {
    plugins.edgy.enable = true;

    keymaps = [
      {
        mode = [ "n" ];
        key = "<c-s>";
        action = "<CR>";
        options.desc = "Submit Prompt";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>aa";
        action.__raw = "        function()
          return require(\"CopilotChat\").toggle()
        end";
        options.desc = "Toggle (CopilotChat)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>ax";
        action.__raw = "        function()
          return require(\"CopilotChat\").reset()
        end";
        options.desc = "Clear (CopilotChat)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>aq";
        action.__raw = "        function()
          vim.ui.input({
            prompt = \"Quick Chat: \",
          }, function(input)
            if input ~= \"\" then
              require(\"CopilotChat\").ask(input)
            end
          end)
        end";
        options.desc = "Quick Chat (CopilotChat)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>ap";
        action.__raw = "        function()
          require(\"CopilotChat\").select_prompt()
        end";
        options.desc = "Prompt Actions (CopilotChat)";
      }
    ];
  };
}
