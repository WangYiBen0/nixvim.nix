{
  plugins.mini-hipatterns = {
    enable = true;
    # Upstream uses `LazyFile`, a lazy.nvim pseudo-event; this repo's equivalent
    # (see treesitter.nix) is the set of real file events plus DeferredUIEnter.
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
      "BufWritePre"
      "DeferredUIEnter"
    ];

    settings = {
      # Custom LazyVim option consumed by the `tailwind` highlighter below.
      tailwind = {
        enabled = true;
        ft = [
          "astro"
          "css"
          "heex"
          "html"
          "html-eex"
          "javascript"
          "javascriptreact"
          "rust"
          "svelte"
          "typescript"
          "typescriptreact"
          "vue"
        ];
        # full: the whole css class will be highlighted
        # compact: only the color will be highlighted
        style = "full";
      };

      highlighters = {
        hex_color.__raw = ''
          require("mini.hipatterns").gen_highlighter.hex_color({ priority = 2000 })
        '';
        shorthand = {
          pattern = "()#%x%x%x()%f[^%x%w]";
          group.__raw = ''
            function(_, _, data)
              ---@type string
              local match = data.full_match
              if match == "#add" then
                return
              end
              local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
              local hex_color = "#" .. r .. r .. g .. g .. b .. b

              return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
            end
          '';
          extmark_opts = {
            priority = 2000;
          };
        };

        # Tailwind CSS utility classes, backed by the vendored palette in
        # `lua/lazyvim/hipatterns-colors.lua`.
        tailwind = {
          pattern.__raw = ''
            function()
              local tw = (require("mini.hipatterns").config or {}).tailwind or {}
              if not vim.tbl_contains(tw.ft or {}, vim.bo.filetype) then
                return
              end
              if tw.style == "full" then
                return "%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]"
              elseif tw.style == "compact" then
                return "%f[%w:-][%w:-]+%-()[a-z%-]+%-%d+()%f[^%w:-]"
              end
            end
          '';
          group.__raw = ''
            function(_, _, m)
              local palette = require("lazyvim.hipatterns-colors")
              local match = m.full_match
              local color, shade = match:match("[%w-]+%-([a-z%-]+)%-(%d+)")
              shade = tonumber(shade)
              local bg = vim.tbl_get(palette.colors, color, shade)
              if bg then
                local hl = "MiniHipatternsTailwind" .. color .. shade
                if not palette.hl[hl] then
                  palette.hl[hl] = true
                  local bg_shade = shade == 500 and 950 or shade < 500 and 900 or 100
                  local fg = vim.tbl_get(palette.colors, color, bg_shade)
                  vim.api.nvim_set_hl(0, hl, { bg = "#" .. bg, fg = "#" .. fg })
                end
                return hl
              end
            end
          '';
          extmark_opts = {
            priority = 2000;
          };
        };
      };
    };
  };

  # Reset the tailwind highlight-group cache when the colorscheme changes.
  autoCmd = [
    {
      event = "ColorScheme";
      callback.__raw = ''
        function()
          require("lazyvim.hipatterns-colors").hl = {}
        end
      '';
    }
  ];
}
