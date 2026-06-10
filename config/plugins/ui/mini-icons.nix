{
  plugins.mini = {
    enable = true;

    modules.icons = {
      style = "default";
      file = {
        ".keep" = {
          glyph = "󰊢";
          hl = "MiniIconsGrey";
        };
        "devcontainer.json" = {
          glyph = "";
          hl = "MiniIconsAzure";
        };
      };
      filetype = {
        dotenv = {
          glyph = "";
          hl = "MiniIconsYellow";
        };
      };
    };
    mockDevIcons = true;
  };
}
