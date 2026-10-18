{
  plugins.mini-move = {
    enable = true;
    # Upstream uses VeryLazy, which lz.n does not implement.
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
    settings = { };
  };
}
