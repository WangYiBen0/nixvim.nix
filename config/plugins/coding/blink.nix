{
  plugins = {
    blink-cmp = {
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];

      settings = {
        completion = {
          list = {
            selection = {
              preselect = false;
            };
          };
        };

        keymap = {
          preset = "enter";

          "<Tab>" = [
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "fallback"
          ];
          "<C-y>" = [
            "select_and_accept"
          ];
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
      };
    };

    blink-compat.enable = true;
    blink-emoji.enable = true;
    blink-pairs.enable = true;

    friendly-snippets.enable = true;
    luasnip.enable = true;
  };
}
