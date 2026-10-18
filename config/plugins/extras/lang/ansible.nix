# LazyVim extra: lang.ansible
# Best-effort port of .lazyvim-ref/lua/lazyvim/plugins/extras/lang/ansible.lua
# Only active when enabled via `extras`.
{ lib, config, ... }:
{
  config = lib.mkIf ((config.extras.lang or { }).ansible or false) {

    plugins = {
      lsp = {
        servers = {
          ansiblels.enable = true;
        };
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>ta";
        action.__raw = "        function()
          require(\"ansible\").run()
        end";
        options.desc = "Ansible Run Playbook/Role";
      }
    ];
  };
}
