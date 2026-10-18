{
  plugins.lint = {
    enable = true;
    # Package the linters referenced by `lintersByFt` from nixpkgs,
    # so extras do not depend on Mason-style runtime downloads.
    autoInstall.enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
      "BufWritePre"
    ];

    autoCmd = {
      event = [
        "BufWritePost"
        "BufReadPost"
        "InsertLeave"
      ];
      callback = {
        __raw = ''
          function()
            if pcall(require, "lint") then
              require("lint").try_lint()
            end
          end
        '';
      };
    };

    lintersByFt = {
      fish = [ "fish" ];
      rust = [ "clippy" ];
    };
  };
}
