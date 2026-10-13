# LazyVim extra: lang.scala
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/scala.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.scala" config.lazyvim.extras) {

    # treesitter parsers
    lazyvim.extraTreesitterParsers = [
      "scala"
    ];

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>me";
        action.__raw = "        function()
          require(\"telescope\").extensions.metals.commands()
        end";
        options.desc = "Metals commands";
      }
      {
        mode = [ "n" ];
        key = "<leader>mc";
        action.__raw = "        function()
          require(\"metals\").compile_cascade()
        end";
        options.desc = "Metals compile cascade";
      }
      {
        mode = [ "n" ];
        key = "<leader>mh";
        action.__raw = "        function()
          require(\"metals\").hover_worksheet()
        end";
        options.desc = "Metals hover worksheet";
      }
    ];
  };
}
