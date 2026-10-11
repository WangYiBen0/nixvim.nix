# LazyVim extra: lang.yaml
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/yaml.lua
# Only active when listed in `lazyvim.extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.yaml" config.lazyvim.extras) {

    plugins = {
      lsp = {
        servers = {
          yamlls.enable = true;
          yamlls.settings = {
            redhat = {
              telemetry = {
                enabled = false;
              };
            };
            yaml = {
              schemaStore = {
                enable = false;
                url = "";
              };
              validate = true;
              keyOrdering = false;
              format = {
                enable = true;
              };
            };
          };
        };
      };
    };
  };
}
