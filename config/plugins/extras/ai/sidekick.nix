# LazyVim extra: ai.sidekick
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/ai/sidekick.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.ai or { }).sidekick or false) {
    plugins.sidekick.enable = true;

    keymaps = [
      {
        mode = [
          "n"
          "t"
          "i"
          "x"
        ];
        key = "<c-.>";
        action.__raw = "        function() require(\"sidekick.cli\").focus() end";
        options.desc = "Sidekick Focus";
      }
      {
        mode = [ "n" ];
        key = "<leader>aa";
        action.__raw = "        function() require(\"sidekick.cli\").toggle() end";
        options.desc = "Sidekick Toggle CLI";
      }
      {
        mode = [ "n" ];
        key = "<leader>as";
        action.__raw = "        function() require(\"sidekick.cli\").select() end";
        options.desc = "Select CLI";
      }
      {
        mode = [ "n" ];
        key = "<leader>ad";
        action.__raw = "        function() require(\"sidekick.cli\").close() end";
        options.desc = "Detach a CLI Session";
      }
      {
        mode = [
          "x"
          "n"
        ];
        key = "<leader>at";
        action.__raw = "        function() require(\"sidekick.cli\").send({ msg = \"{this}\" }) end";
        options.desc = "Send This";
      }
      {
        mode = [ "n" ];
        key = "<leader>af";
        action.__raw = "        function() require(\"sidekick.cli\").send({ msg = \"{file}\" }) end";
        options.desc = "Send File";
      }
      {
        mode = [ "x" ];
        key = "<leader>av";
        action.__raw = "        function() require(\"sidekick.cli\").send({ msg = \"{selection}\" }) end";
        options.desc = "Send Visual Selection";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>ap";
        action.__raw = "        function() require(\"sidekick.cli\").prompt() end";
        options.desc = "Sidekick Select Prompt";
      }
    ];
  };
}
