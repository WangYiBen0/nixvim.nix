{
  lib,
  ...
}:
let
  # All Lua sources shipped in this repository. They are exposed to Neovim's
  # runtimepath through nixvim's `extraFiles` option, which is what makes
  # `require("lazyvim.util")` and friends resolve at runtime.
  luaRoot = ../lua;
  luaFiles = lib.filesystem.listFilesRecursive luaRoot;
in
{
  extraFiles = lib.listToAttrs (
    map (file: {
      # Keep the `lua/` prefix so the files land on the runtimepath exactly
      # like a regular Lua plugin directory.
      name = "lua/" + lib.removePrefix (toString luaRoot + "/") (toString file);
      value.source = file;
    }) luaFiles
  );

  # `_G.LazyVim` has to exist before any plugin config runs, because some of
  # them (lualine, conform) call into it while their `luaConfig` is evaluated.
  extraConfigLuaPre = ''
    require("lazyvim.config")
  '';

  # Formatters are registered once every plugin is available, mirroring
  # LazyVim's `LazyVim.format.setup()` call from its own `config/init.lua`.
  extraConfigLuaPost = ''
    LazyVim.format.setup()
  '';
}
