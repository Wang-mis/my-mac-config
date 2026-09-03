# macOS 终端开发环境配置

本文档描述一套以 Ghostty、Zsh、Zellij、Yazi 和 LazyVim 为核心的 macOS
开发环境。Neovim 配置由本仓库管理；其他工具的活动配置仍位于用户目录，
并在本文中记录其行为。

## 配置架构

| 层级 | 工具 | 职责 |
| --- | --- | --- |
| 终端界面 | Ghostty | 字体、主题、窗口、原生标签页与临时分屏 |
| Shell | Zsh + Oh My Zsh | 命令交互、补全、提示、工具初始化 |
| 命令行增强 | eza、fzf、zoxide、Yazi | 文件浏览、搜索和目录跳转 |
| 会话复用 | Zellij | 可恢复的项目会话、项目内标签页与窗格 |
| 编辑器 | Neovim + LazyVim | 多语言编辑、LSP、格式化、诊断与 Git 集成 |

Ghostty 与 Zellij 有意保留两层能力：Ghostty 处理临时 GUI 窗口，Zellij 处理需要恢复或长期保留的项目会话。

## Ghostty

活动配置：`~/.config/ghostty/config`

- 字体为 Maple Mono NF CN 14，启用字形加粗与 8% 单元格高度调整。
- 主题为 Kanagawa Wave，背景不透明度 0.92，模糊半径 20。
- 窗口采用透明标题栏、平衡边距和状态恢复。
- 左 Option 作为 Alt，右 Option 保留 macOS 字符输入能力。
- 回滚缓冲上限为 10,000,000 字节，每个终端 surface 独立计算。
- 选中内容自动复制到系统剪贴板；右键自动选择复制或粘贴。
- 粘贴保护和 bracketed paste 均已启用。
- Shell integration 自动检测 Zsh，启用 cursor、sudo、title、ssh-env、ssh-terminfo 和 path。
- 解除 Ghostty 默认的 `Cmd+Shift+P` 与 `Cmd+Shift+F`，将它们传递给
  Neovim 的命令面板和项目搜索。
- 将 `Shift+Enter`、`Cmd+Shift+Enter`、`Cmd+H` 和 `Cmd+L` 编码为
  Neovim 可区分的 CSI 序列；`Cmd+Alt+Enter` 用于切换 Ghostty 分屏最大化。
- 后台命令运行超过 30 秒且窗口未聚焦时发送系统通知。
- 全局快速终端从鼠标所在屏幕顶部展开并自动隐藏。

## Zsh 与命令行工具

活动配置：`~/.zshenv`、`~/.zshrc`

### Shell 基础

- 使用系统 Zsh 与 Oh My Zsh。
- Oh My Zsh 主题为 `agnoster`，插件为 `git`、`macos`、`brew`。
- Oh My Zsh 自动更新关闭，更新由用户主动执行。
- Homebrew shell environment 自动加载。
- `EDITOR` 与 `VISUAL` 均为 `nvim`。
- `~/.local/bin` 位于 PATH 前部，供 uv 等用户级工具使用。

### 命令增强

- fzf：加载 Zsh 补全与历史/文件模糊搜索快捷键。
- eza：替代交互式 `ls`，提供图标、Git 状态和目录树。
- zoxide：提供基于使用频率的 `z` 目录跳转。
- Yazi：通过 `y` 启动，退出后 Shell 会进入 Yazi 最后所在目录。
- zsh-autosuggestions：根据历史记录显示行内建议。
- zsh-syntax-highlighting：在命令执行前显示语法有效性。
- nvm：仅在首次调用 `nvm` 时加载；Homebrew Node、npm、npx 与 Bun 可立即使用。

### Zellij 命令入口

- `za`：以当前目录名连接或创建会话。
- `za <name>`：连接或创建指定会话。
- `zl`：列出会话。
- 已处于 Zellij 内时，`za` 会拒绝创建嵌套会话。

## Zellij

活动配置：`~/.config/zellij/config.kdl`

- 使用内置 `kanagawa` 主题。
- 默认进入 Normal 模式，保留完整的模式化键位；Scroll 与 Move 模式入口
  分别使用 `Alt+S` 与 `Alt+M`，避免占用 Neovim 的 `Ctrl+S` 与 `Ctrl+H`。
- 强制关闭终端时执行 detach，不结束会话。
- 开启会话序列化，用于恢复标签页、窗格、工作目录和命令信息。
- scrollback editor 固定为 `/opt/homebrew/bin/nvim`。
- 启动提示与版本说明关闭。
- `zellij:link` 后台插件启用。
- 不自动随 Shell 启动，不设固定会话名，也不使用固定项目 layout。

## Yazi

活动配置：`~/.config/yazi/yazi.toml`、`~/.config/yazi/keymap.toml`

- 管理器三栏比例为 `1:3:4`，目录优先并采用自然排序。
- 文件列表显示大小，隐藏文件默认不显示，符号链接可见。
- 预览不换行，Tab 宽度为 2。
- 文本和 JSON 使用 `$EDITOR` 阻塞打开，退出 Neovim 后返回 Yazi。
- 其他文件交给 macOS `open`，并支持在 Finder 中显示。
- 项目快捷目录为 `~/Documents/Programs`。

## Neovim 与 LazyVim

活动配置：`~/.config/nvim`，符号链接目标为本仓库的 `nvim/`。

### 基础行为

- 以 LazyVim v8 和 lazy.nvim 为基础。
- 主题为 Kanagawa Wave，背景不透明，启用斜体注释和 undercurl。
- 插件更新检查开启但不弹出通知。
- `lazy-lock.json` 锁定插件 commit，保证环境可复现。
- Markdown 和 MDX 不运行 markdownlint，关闭英文拼写检查，保存时也不自动格式化；
  仍保留 marksman、渲染、预览与手动格式化。
- 提供 VS Code 风格的 `Cmd`、功能键与 `Alt` 快捷键别名，同时保留 LazyVim
  原生 Leader 键体系。
- 使用 tabout.nvim 跳出括号、引号和标签；Blink.cmp 先处理 snippet 与 AI
  建议，再将 Tab 交给 TabOut，无法跳出时执行普通缩进。
- Insert 模式支持在当前行上方或下方插入新行，以及移动到物理行首、行尾。
- Visual 模式使用 `Tab` 与 `Shift+Tab` 缩进或取消缩进，并保持当前选区。

### 语言支持

| 语言 | 主要 LSP/插件 | 格式化 |
| --- | --- | --- |
| C、C++ | clangd、clangd_extensions | clang-format |
| Java | jdtls、nvim-jdtls | google-java-format |
| Python | Pyright、Ruff、venv-selector | Ruff imports + Ruff format |
| Go | gopls | goimports + gofumpt |
| Rust | rust-analyzer、rustaceanvim、crates.nvim | rustfmt/LSP fallback |
| JavaScript、TypeScript、React | vtsls、JSX/TSX Treesitter | Biome 或 Prettier |
| Vue | vue-language-server + vtsls | Biome 或 Prettier |
| Astro | astro-language-server + vtsls | Biome 或 Prettier |
| HTML | html-lsp、Emmet | Prettier |
| CSS、SCSS、LESS | css-lsp、Emmet | Biome 支持时用 Biome，否则 Prettier |
| JSON | jsonls、SchemaStore | Biome 或 Prettier |
| Markdown | marksman、render-markdown | 仅手动格式化，不运行 markdownlint |

React 不使用单独 LSP：`.jsx` 与 `.tsx` 分别由 JavaScript/TypeScript、
vtsls、Treesitter 和 Emmet 共同覆盖。

### 项目感知格式化

格式化由 Conform 统一调度：

1. 在向上查找的项目根目录中发现 `biome.json` 或 `biome.jsonc`。
2. 对 Biome 支持的 Web 文件类型选择 `biome-check`。
3. 对没有 Biome 配置的 Web 项目选择 Prettier。
4. HTML 与 LESS 即使位于 Biome 项目内也使用 Prettier，因为当前路由不将它们交给 Biome。
5. Markdown 不在保存时格式化；可使用 `<Space>cf` 主动格式化。

### 外部工具与运行时

Mason 管理编辑器工具，包括 clangd、clang-format、jdtls、Pyright、Ruff、
gopls、rust-analyzer、vtsls、Vue/Astro/HTML/CSS/JSON LSP、Emmet、Prettier 和
marksman。LazyVim Markdown extra 默认声明的 markdownlint-cli2 已从自动安装列表移除。

Mason 不替代语言运行时。编译或运行代码仍需要系统安装相应工具链：

- C/C++：Xcode Command Line Tools 或独立 LLVM。
- Java：JDK。
- Python：Python 解释器与项目虚拟环境。
- Go：Go SDK。
- Rust：rustup、rustc、Cargo 和 rustfmt。
- JavaScript/TypeScript：Node.js 或 Bun。

## 日常维护

### 检查配置

```bash
zsh -n ~/.zshenv ~/.zshrc
zellij setup --check
/Applications/Ghostty.app/Contents/MacOS/ghostty +validate-config
yazi --debug
nvim --headless "+Lazy! sync" +qa
```

### 更新 Neovim

在 Neovim 中执行 `:Lazy` 查看、更新和清理插件，执行 `:Mason` 查看语言服务器
与格式器。更新完成后检查并提交 `nvim/lazy-lock.json`。
