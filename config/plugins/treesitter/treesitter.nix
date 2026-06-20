{
  plugins.treesitter = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
      "BufWritePre"
      "DeferredUIEnter"
    ];

    settings = {
      highlight.enable = true;
      ensure_installed = [
        "bash"
        "c"
        "diff"
        "html"
        "javascript"
        "jsdoc"
        "json"
        "lua"
        "luadoc"
        "luap"
        "markdown"
        "markdown_inline"
        "printf"
        "python"
        "query"
        "regex"
        "toml"
        "tsx"
        "typescript"
        "vim"
        "vimdoc"
        "xml"
        "yaml"
      ];
    };

    nixvimInjections = true;
  };
}
