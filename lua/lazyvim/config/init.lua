-- Static NixVim port of LazyVim's `lazyvim.config`.
-- There is no `lazy.nvim` here, so `LazyVim.config` provides the icon tables
-- and defaults that the (vendored) helper modules reference, in a way that is
-- fully static.
local M = {}

M.version = "16.0.1" -- x-release-please-version

-- LazyVim's `util` sets `_G.LazyVim = require("lazyvim.util")` on load; we
-- wire that back so `LazyVim.*` works everywhere.
_G.LazyVim = _G.LazyVim or require("lazyvim.util")

---@class LazyVimConfig: LazyVimOptions
local defaults = {
  colorscheme = function()
    require("tokyonight").load()
  end,
  defaults = {
    autocmds = true,
    keymaps = true,
  },
  news = {
    lazyvim = true,
    neovim = false,
  },
  icons = {
    misc = {
      dots = "󰇘",
    },
    ft = {
      octo = " ",
      gh = " ",
      ["markdown.gh"] = " ",
    },
    dap = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
    },
    diagnostics = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = "󰨙 ",
      Class = " ",
      Codeium = "󰘦 ",
      Color = " ",
      Control = " ",
      Collapsed = " ",
      Constant = "󰏿 ",
      Constructor = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = "󰊕 ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = "󰊕 ",
      Module = " ",
      Namespace = "󰦮 ",
      Null = " ",
      Number = "󰎠 ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = "󱄽 ",
      String = " ",
      Struct = "󰆼 ",
      Supermaven = " ",
      TabNine = "󰏚 ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = "󰀫 ",
    },
  },
  ---@type table<string, string[]|boolean>?
  kind_filter = {
    default = {
      "Class",
      "Constructor",
      "Enum",
      "Field",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Namespace",
      "Package",
      "Property",
      "Struct",
      "Trait",
    },
    markdown = false,
    help = false,
  },
}

---@class LazyVimConfig
M._options = defaults

setmetatable(M, {
  __index = function(_, key)
    return defaults[key]
  end,
})

LazyVim.config = M
LazyVim.config._options = M._options
LazyVim.config.json = {
  version = 8,
  path = vim.fs.normalize(vim.fn.stdpath("config") .. "/lazyvim.json"),
  data = {
    extras = {},
    install_version = 8,
  },
}

return M