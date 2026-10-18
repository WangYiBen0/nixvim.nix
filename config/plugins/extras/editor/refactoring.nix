# LazyVim extra: editor.refactoring
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/editor/refactoring.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.editor or { }).refactoring or false) {
    plugins.refactoring.enable = true;

    keymaps = [
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>rs";
        action.__raw = "        function()
          return require(\"refactoring\").select_refactor()
        end";
        options.desc = "Select Refactor";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>ri";
        action.__raw = "        function()
          return require(\"refactoring\").inline_var()
        end";
        options.desc = "Inline Variable";
      }
      {
        mode = [ "n" ];
        key = "<leader>rP";
        action.__raw = "        function()
          return require(\"refactoring.debug\").print_loc({ output_location = \"below\" })
        end";
        options.desc = "Debug Print Location";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>rp";
        action.__raw = "        function()
          return require(\"refactoring.debug\").print_var({ output_location = \"below\" }) .. \"iw\"
        end";
        options.desc = "Debug Print Variable";
      }
      {
        mode = [ "n" ];
        key = "<leader>rc";
        action.__raw = "        function()
          return require(\"refactoring.debug\").cleanup({ restore_view = true }) .. \"ag\"
        end";
        options.desc = "Debug Cleanup";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>rf";
        action.__raw = "        function()
          return require(\"refactoring\").extract_func()
        end";
        options.desc = "Extract Function";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>rF";
        action.__raw = "        function()
          return require(\"refactoring\").extract_func_to_file()
        end";
        options.desc = "Extract Function To File";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>rx";
        action.__raw = "        function()
          return require(\"refactoring\").extract_var()
        end";
        options.desc = "Extract Variable";
      }
    ];
  };
}
