{
  plugins.mini-comment = {
    enable = true;
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
    settings = {
      options = {
        custom_commentstring = {
          __raw = ''
            function()
              local ok, res = pcall(function()
                return require("ts_context_commentstring.internal").calculate_commentstring()
              end)
              if ok and res and res ~= vim.NIL then
                return res
              end
              return vim.bo.commentstring
            end
          '';
        };
      };
    };
  };

  plugins.ts-context-commentstring = {
    enable = true;
    settings = {
      enable_autocmd = false;
    };
  };

  # Note: LazyVim uses "VeryLazy" for mini-comment; under lz.n "VeryLazy"/"LazyFile"
  # are pseudo-events and silently no-op. Using "DeferredUIEnter" matches the repo's
  # equivalent lazy-load semantics.
}
