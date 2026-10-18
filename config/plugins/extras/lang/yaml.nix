# LazyVim extra: lang.yaml
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/yaml.lua
# Only active when listed in `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf (lib.elem "lang.yaml" config.extras) {

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
              keyOrdering = false;
              schemaStore = {
                url = "";
                enable = false;
              };
              format = {
                enable = true;
              };
              validate = true;
            };
          };
        };
      };
    };
  };
}
