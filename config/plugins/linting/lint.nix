{
  plugins.lint = {
    enable = true;
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
