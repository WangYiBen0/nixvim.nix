{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      lspBuf = {
        gd = "definition";
        gr = "references";
        gI = "implementation";
        gy = "type_definition";
        gD = "declaration";
        K = "hover";
        cr = "rename";
      };

      extra = [ ];
    };

    capabilities = ''
      vim.tbl_deep_extend("force", capabilities, {
        workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        })
    '';

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      fish_lsp.enable = true;
      gopls.enable = true;
      html.enable = true;
      jsonls.enable = true;

      lua_ls = {
        enable = true;
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false;
            };
            codeLens = {
              enable = true;
            };
            completion = {
              callSnippet = "Replace";
            };
            doc = {
              privateName = [ "^_" ];
            };
            hint = {
              enable = true;
              setType = false;
              paramType = true;
              paramName = "Disable";
              semicolon = "Disable";
              arrayIndex = "Disable";
            };
          };
        };
      };

      marksman.enable = true;
      nixd.enable = true;
      pyright.enable = true;

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        installRustfmt = true;
      };

      systemd_ls.enable = true;
      texlab.enable = true;
      ts_ls.enable = true;
      tinymist.enable = true;
      vimls.enable = true;
      yamlls.enable = true;
    };
  };
}
