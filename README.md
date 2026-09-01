# ❄️ nixvim.nix

[![Built with Nix](https://img.shields.io/badge/Built_with-Nix-blue?logo=nixos)](https://nixos.org)
[![Powered by NixVim](https://img.shields.io/badge/Powered_by-NixVim-red?logo=neovim)](https://github.com/nix-community/nixvim)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

这是 **W1ngD1nGa5ter** 的独立 NixVim 配置仓库。

## 📖 简介

`nixvim.nix` 是一个基于 [NixVim](https://github.com/nix-community/nixvim) 构建的 Neovim 配置。它旨在通过 Nix 的声明式语法，实现一个高度可重用、纯净且开箱即用的编辑器环境。

## ✨ 特性

- [x] **完全声明式**: 使用 Nix 管理所有插件和配置。
- [x] **多端一致性**: 无论是在 NixOS 还是其他 Linux 发行版上，都能获得完全一致的体验。
- [x] **LSP & 补全**: 预设针对 Rust, C/C++, Python 和 Nix 等语言的开发环境。
- [x] **UI 美化**: 基于 Catppuccin 调色板。
- [ ] **模块化设计**: 方便根据需要启用或禁用特定功能模块。

## 🚀 快速开始

### 预备条件
确保你的系统已安装 [Nix](https://nixos.org/download.html) 并启用了 `flakes` 特性。

### 尝试运行 (无需安装)
你可以通过以下命令直接试用此配置：
```bash
nix run github:WangYiben0/nixvim.nix
```

## 🛠️ 安装与集成

### 作为 Flake 投入使用
在你的 `flake.nix` 中添加此输入：

```nix
inputs.my-nixvim.url = "github:WangYiben0/nixvim.nix";
```

## 📂 项目结构
```text
.
├── flake.nix           # 入口文件
├── config/             # 模块化配置目录
│   ├── autocmds.nix    # 自动命令
│   ├── keymaps.nix     # 按键映射
│   ├── options.nix     # 选项设置
│   └── plugins/        # 插件列表
│       ├── edit/       # 编辑相关
│       ├── lang/       # 语言服务器
│       ├── ui/         # 用户界面
│       └── others/     # 杂项
└── LICENSE             # 许可证
```

## 🤝 致谢
- [NixVim](https://github.com/nix-community/nixvim) - The framework.
- [LazyVim](https://github.com/LazyVim/LazyVim) - 灵感来源。

---

Maintainers:
- [W1ngD1nGa5ter](https://github.com/WangYiben0)
