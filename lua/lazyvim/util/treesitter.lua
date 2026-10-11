---@class lazyvim.util.treesitter
local M = {}

M._installed = nil ---@type table<string,boolean>?
M._queries = {} ---@type table<string,boolean>

---@param update boolean?
function M.get_installed(update)
  if update or M._installed == nil then
    M._installed, M._queries = {}, {}
    -- Parsers are provided statically by Nix, so discover them from the
    -- runtimepath instead of asking nvim-treesitter to compile anything.
    local langs = {}
    for _, dir in ipairs(vim.api.nvim_list_runtime_paths()) do
      local parsers = dir .. "/parser"
      if vim.fn.isdirectory(parsers) == 1 then
        for _, file in ipairs(vim.fn.glob(parsers .. "/*", false, true)) do
          langs[vim.fn.fnamemodify(file, ":t:r")] = true
        end
      end
    end
    for lang in pairs(langs) do
      M._installed[lang] = true
    end
  end
  return M._installed or {}
end

---@param lang string
---@param query string
function M.have_query(lang, query)
  local key = lang .. ":" .. query
  if M._queries[key] == nil then
    M._queries[key] = vim.treesitter.query.get(lang, query) ~= nil
  end
  return M._queries[key]
end

---@param what string|number|nil
---@param query? string
---@overload fun(buf?:number):boolean
---@overload fun(ft:string):boolean
---@return boolean
function M.have(what, query)
  what = what or vim.api.nvim_get_current_buf()
  what = type(what) == "number" and vim.bo[what].filetype or what --[[@as string]]
  local lang = vim.treesitter.language.get_lang(what)
  if lang == nil or M.get_installed()[lang] == nil then
    return false
  end
  if query and not M.have_query(lang, query) then
    return false
  end
  return true
end

function M.foldexpr()
  return M.have(nil, "folds") and vim.treesitter.foldexpr() or "0"
end

function M.indentexpr()
  return M.have(nil, "indents") and require("nvim-treesitter").indentexpr() or -1
end

---@return string?
local function win_find_cl()
  local path = "C:/Program Files (x86)/Microsoft Visual Studio"
  local pattern = "*/*/VC/Tools/MSVC/*/bin/Hostx64/x64/cl.exe"
  return vim.fn.globpath(path, pattern, true, true)[1]
end

---@return boolean ok, lazyvim.util.treesitter.Health health
function M.check()
  local is_win = vim.fn.has("win32") == 1
  ---@param tool string
  ---@param win boolean?
  local function have(tool, win)
    return (win == nil or is_win == win) and vim.fn.executable(tool) == 1
  end

  local have_cc = vim.env.CC ~= nil or have("cc", false) or have("cl", true) or (is_win and win_find_cl() ~= nil)

  ---@class lazyvim.util.treesitter.Health: table<string,boolean>
  local ret = {
    ["C compiler"] = have_cc,
    tar = have("tar"),
    curl = have("curl"),
  }
  local ok = true
  for _, v in pairs(ret) do
    ok = ok and v
  end
  return ok, ret
end

--- Parsers are built statically by Nix (see `plugins.treesitter.grammarPackages`),
--- so there is nothing to build at runtime. This is kept as a no-op for
--- compatibility with the upstream API.
---@param cb fun()
function M.build(cb)
  cb()
end

return M
