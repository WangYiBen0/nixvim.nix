{
  plugins.mini-icons = {
    enable = true;
    mockDevIcons = true;
    settings = {
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
  };
}
