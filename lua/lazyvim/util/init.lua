---@class lazyvim.util: LazyUtilCore
---@field config LazyVimConfig
---@field treesitter lazyvim.util.treesitter
---@field lsp lazyvim.util.lsp
---@field root lazyvim.util.root
---@field terminal lazyvim.util.terminal
---@field format lazyvim.util.format
---@field inject lazyvim.util.inject
---@field json lazyvim.util.json
---@field lualine lazyvim.util.lualine
---@field mini lazyvim.util.mini
---@field pick lazyvim.util.pick
---@field cmp lazyvim.util.cmp
---@field deprecated lazyvim.util.deprecated
--
-- Static NixVim port of LazyVim's `lazyvim.util` module.
-- This file intentionally reimplements the parts of `lazy.core.util` that
-- LazyVim relies on, WITHOUT requiring lazy.nvim (which is out of scope),
-- and provides the same `LazyVim.*` API surface used by the vendored helper
-- modules below.
local M = {}
M.deprecated = require("lazyvim.util.deprecated")

setmetatable(M, {
  __index = function(t, k)
    if M.deprecated[k] then
      return M.deprecated[k]()
    end
    if pcall(require, "lazyvim.util." .. k) then
      t[k] = require("lazyvim.util." .. k)
      M.deprecated.decorate(k, t[k])
      return t[k]
    end
    return nil
  end,
})

function M.is_win()
  return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

-- In a static NixVim config there is no `lazy.core.config` spec, so plugin
-- availability is decided from a static registry that mirrors the LazyVim
-- default plugin set implemented in this configuration.
M.plugins = {} ---@type table<string, {name:string, dir?:string}>

---@param name string
function M.add_plugin(name)
  M.plugins[name] = { name = name }
end

for _, name in ipairs({
  "LazyVim",
  "blink.cmp",
  "bufferline.nvim",
  "catppuccin",
  "conform.nvim",
  "flash.nvim",
  "friendly-snippets",
  "gitsigns.nvim",
  "grug-far.nvim",
  "lazydev.nvim",
  "lualine.nvim",
  "luasnip",
  "mini.ai",
  "mini.animate",
  "mini.comment",
  "mini.diff",
  "mini.files",
  "mini.hipatterns",
  "mini.icons",
  "mini.indentscope",
  "mini.move",
  "mini.pairs",
  "mini.pick",
  "mini.snippets",
  "mini.starter",
  "mini.surround",
  "nvim-lint",
  "nvim-lspconfig",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-autotag",
  "noice.nvim",
  "nui.nvim",
  "persistence.nvim",
  "plenary.nvim",
  "snacks.nvim",
  "todo-comments.nvim",
  "tokyonight.nvim",
  "trouble.nvim",
  "ts-comments.nvim",
  "which-key.nvim",
}) do
  M.add_plugin(name)
end

---@param name string
---@return table<string, any>?
function M.get_plugin(name)
  return M.plugins[name]
end

---@param name string
---@param path string?
function M.get_plugin_path(name, path)
  local plugin = M.get_plugin(name)
  path = path and "/" .. path or ""
  return plugin and plugin.dir and (plugin.dir .. path) or nil
end

---@param plugin string
function M.has(plugin)
  return M.get_plugin(plugin) ~= nil
end

--- Checks if an (out-of-scope) LazyVim extra would be enabled.
--- Since extras toggling is not implemented, this is always false.
---@param extra string
function M.has_extra(extra)
  return false
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

--- This extends a deeply nested list with a key in a table
--- that is a dot-separated string.
--- The nested list will be created if it does not exist.
---@generic T
---@param t T[]
---@param key string
---@param values T[]
---@return T[]?
function M.extend(t, key, values)
  local keys = vim.split(key, ".", { plain = true })
  for i = 1, #keys do
    local k = keys[i]
    t[k] = t[k] or {}
    if type(t) ~= "table" then
      return
    end
    t = t[k]
  end
  return vim.list_extend(t, values)
end

---@param name string
function M.opts(name)
  -- No lazy.nvim opts registry; return an empty table so `LazyVim.opts(x).foo`
  -- patterns degrade to a safe empty value.
  return {}
end

---@param opts? LazyNotifyOpts
function M.deprecate(old, new, opts)
  M.warn(
    ("`%s` is deprecated. Please use `%s` instead"):format(old, new),
    vim.tbl_extend("force", {
      title = "LazyVim",
      once = true,
      stacktrace = true,
      stacklevel = 6,
    }, opts or {})
  )
end

-- delay notifications till vim.notify was replaced or after 500ms
function M.lazy_notify()
  local notifs = {}
  local function temp(...)
    table.insert(notifs, vim.F.pack_len(...))
  end

  local orig = vim.notify
  vim.notify = temp

  local timer = vim.uv.new_timer()
  local check = assert(vim.uv.new_check())

  local replay = function()
    timer:stop()
    check:stop()
    if vim.notify == temp then
      vim.notify = orig
    end
    vim.schedule(function()
      for _, notif in ipairs(notifs) do
        vim.notify(vim.F.unpack_len(notif))
      end
    end)
  end

  check:start(function()
    if vim.notify ~= temp then
      replay()
    end
  end)
  timer:start(500, 0, replay)
end

---@param name string
function M.is_loaded(name)
  return M.has(name)
end

---@param name string
---@param fn fun(name:string)
function M.on_load(name, fn)
  if M.is_loaded(name) then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

-- Wrapper around vim.keymap.set that will
-- not create a keymap if a lazy key handler exists.
-- There is no lazy key handler in a static config, so this just defaults
-- `silent` to true.
function M.safe_keymap_set(mode, lhs, rhs, opts)
  local modes = type(mode) == "string" and { mode } or mode
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(modes, lhs, rhs, opts)
end

---@generic T
---@param list T[]
---@return T[]
function M.dedup(list)
  local ret = {}
  local seen = {}
  for _, v in ipairs(list) do
    if not seen[v] then
      table.insert(ret, v)
      seen[v] = true
    end
  end
  return ret
end

M.CREATE_UNDO = vim.api.nvim_replace_termcodes("<c-G>u", true, true, true)
function M.create_undo()
  if vim.api.nvim_get_mode().mode == "i" then
    vim.api.nvim_feedkeys(M.CREATE_UNDO, "n", false)
  end
end

--- Gets a path to a package in the Mason registry.
---@param pkg string
---@param path? string
---@param opts? { warn?: boolean }
function M.get_pkg_path(pkg, path, opts)
  local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
  opts = opts or {}
  opts.warn = opts.warn == nil and true or opts.warn
  path = path or ""
  local ret = vim.fs.normalize(root .. "/packages/" .. pkg .. "/" .. path)
  if opts.warn then
    vim.schedule(function()
      if not vim.loop.fs_stat(ret) then
        M.warn(
          ("Mason package path not found for **%s**:\n- `%s`\nYou may need to force update the package."):format(
            pkg,
            path
          )
        )
      end
    end)
  end
  return ret
end

--- Override the default title for notifications.
for _, level in ipairs({ "info", "warn", "error" }) do
  M[level] = function(msg, opts)
    opts = opts or {}
    opts.title = opts.title or "LazyVim"
    local lvl = level == "info" and vim.log.levels.INFO or level == "warn" and vim.log.levels.WARN
      or vim.log.levels.ERROR
    if type(msg) == "table" then
      msg = table.concat(msg, "\n")
    end
    vim.notify(msg, lvl, opts)
  end
end

local cache = {} ---@type table<(fun()), table<string, any>>
---@generic T: fun()
---@param fn T
---@return T
function M.memoize(fn)
  return function(...)
    local key = vim.inspect({ ... })
    cache[fn] = cache[fn] or {}
    if cache[fn][key] == nil then
      cache[fn][key] = fn(...)
    end
    return cache[fn][key]
  end
end

-- Safe wrapper around snacks to prevent errors when things are still loading.
function M.statuscolumn()
  return package.loaded.snacks and require("snacks.statuscolumn").get() or ""
end

--- LazyVim's `set_default`: only set the option if it is safe (i.e. it isn't
--- overridden by an unrelated plugin). Without lazy.nvim we still check the
--- global/local defaults exactly like upstream.
local _defaults = {} ---@type table<string, boolean>

---@param option string
---@param value string|number|boolean
---@return boolean was_set
function M.set_default(option, value)
  local l = vim.api.nvim_get_option_value(option, { scope = "local" })
  local g = (LazyVim.config._options or {})[option]
    or vim.api.nvim_get_option_value(option, { scope = "global" })

  _defaults[("%s=%s"):format(option, value)] = true
  local key = ("%s=%s"):format(option, l)

  if l ~= g and not _defaults[key] then
    -- Option does not match global and is not a default value
    local info = vim.api.nvim_get_option_info2(option, { scope = "local" })
    ---@param e vim.fn.getscriptinfo.ret
    local scriptinfo = vim.tbl_filter(function(e)
      return e.sid == info.last_set_sid
    end, vim.fn.getscriptinfo())
    local by_rtp = #scriptinfo == 1 and vim.startswith(scriptinfo[1].name, vim.fn.expand("$VIMRUNTIME"))
    if not by_rtp then
      return false
    end
  end

  vim.api.nvim_set_option_value(option, value, { scope = "local" })
  return true
end

-- LazyVim config table (assigned by `lazyvim.config`). Defaults to a minimal
-- table so modules referencing `LazyVim.config` don't fail when only `util`
-- was required.
M.config = M.config or {}

-- provide a `norm`/`merge`/`is_list`/`try` set matching `lazy.core.util` so
-- the vendored helper modules work unchanged.

function M.merge(...)
  local function is_list(t)
    local i = 0
    for _ in pairs(t) do
      i = i + 1
      if t[i] == nil then
        return false
      end
    end
    return true
  end
  local function can_merge(v)
    return type(v) == "table" and (vim.tbl_isempty(v) or not is_list(v))
  end
  local ret = select(1, ...)
  if ret == vim.NIL then
    ret = nil
  end
  for i = 2, select("#", ...) do
    local value = select(i, ...)
    if can_merge(ret) and can_merge(value) then
      for k, v in pairs(value) do
        ret[k] = M.merge(ret[k], v)
      end
    elseif value == vim.NIL then
      ret = nil
    elseif value ~= nil then
      ret = value
    end
  end
  return ret
end

function M.norm(path)
  if type(path) ~= "string" then
    return path
  end
  if path:sub(1, 1) == "~" then
    local home = vim.uv.os_homedir()
    if home:sub(-1) == "\\" or home:sub(-1) == "/" then
      home = home:sub(1, -2)
    end
    path = home .. path:sub(2)
  end
  path = path:gsub("\\", "/"):gsub("/+", "/")
  return path:sub(-1) == "/" and path:sub(1, -2) or path
end

function M.is_list(t)
  local i = 0
  for _ in pairs(t) do
    i = i + 1
    if t[i] == nil then
      return false
    end
  end
  return true
end

---@generic R
---@param fn fun():R?
---@param opts? string|{msg:string, on_error:fun(msg)}
---@return R
function M.try(fn, opts)
  opts = type(opts) == "string" and { msg = opts } or opts or {}
  local msg = opts.msg
  local error_handler = function(err)
    msg = (msg and (msg .. "\n\n") or "") .. err
    if opts.on_error then
      opts.on_error(msg)
    else
      M.error(msg)
    end
    return err
  end
  local ok, result = xpcall(fn, error_handler)
  return ok and result or nil
end

function M.track() end

return M