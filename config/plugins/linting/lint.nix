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
    };

    lintersByFt = {
      fish = [ "fish" ];
    };
  };
}
