# 终端与 LazyVim 常用快捷键

本文档是 Ghostty、Zsh、Zellij、Yazi 和 LazyVim 的日常快捷键速查表。

## 记号

| 记号 | 含义 |
| --- | --- |
| `Cmd` | macOS Command |
| `Ctrl` | Control |
| `Alt` | Ghostty 中的左 Option |
| `<Space>` | LazyVim Leader 键 |
| Normal | Zellij 默认模式或 Neovim 普通模式，依上下文判断 |

## Ghostty

| 快捷键 | 操作 |
| --- | --- |
| `Ctrl+\`` | 在任意应用中显示或隐藏顶部快速终端 |
| `Cmd+T` | 新建标签页 |
| `Cmd+Shift+←/→` | 上一个/下一个标签页 |
| `Cmd+D` | 向右分屏 |
| `Cmd+Shift+D` | 向下分屏 |
| `Cmd+W` | 关闭当前 surface |
| `Cmd+方向键` | 切换 Ghostty 分屏焦点 |
| `Cmd+Shift+↑/↓` | 跳到上一个/下一个命令提示符 |
| `Cmd+Alt+Enter` | 最大化或恢复当前 Ghostty 分屏 |
| 鼠标选中 | 自动复制到系统剪贴板 |
| 右键 | 根据当前状态复制或粘贴 |

## Shell 命令

| 命令 | 操作 |
| --- | --- |
| `vim` | 启动 Neovim |
| `ls` | eza 图标列表 |
| `ll` | 包含隐藏项、详细信息和 Git 状态的列表 |
| `lt` | 显示两层目录树 |
| `z <keyword>` | 使用 zoxide 跳转到匹配目录 |
| `y [path]` | 启动 Yazi，退出后进入最后所在目录 |
| `za` | 以当前目录名连接或创建 Zellij 会话 |
| `za <name>` | 连接或创建指定 Zellij 会话 |
| `za ` 后按 `Tab` | 动态补全 Zellij 会话名，也支持先输入名称前缀 |
| `zl` | 列出 Zellij 会话 |
| `nvm ...` | 首次调用时加载 nvm，然后执行命令 |
| `Ctrl+R` | fzf 模糊搜索命令历史 |
| `Ctrl+T` | fzf 搜索文件并插入命令行 |
| `Alt+C` | fzf 搜索目录并进入 |

## Zellij

Zellij 使用默认布局，顶部显示 Tab 栏，底部显示当前模式可用的快捷键。
布局在创建会话时确定，修改配置不会重绘已经存在的会话。

### 模式入口

| 快捷键 | 模式/操作 |
| --- | --- |
| `Ctrl+P` | Pane 模式 |
| `Ctrl+T` | Tab 模式 |
| `Ctrl+N` | Resize 模式 |
| `Alt+M` | Move 模式 |
| `Alt+S` | Scroll 模式 |
| `Ctrl+O` | Session 模式 |
| `Ctrl+B` | tmux 兼容模式 |
| `Ctrl+G` | 锁定/解锁键位 |
| `Ctrl+Q` | 退出 Zellij |
| `Esc` | 返回 Normal 模式 |

窗格边框默认隐藏。按 `Ctrl+P` 后按 `z` 可以临时显示或再次隐藏边框。

### 直接操作

| 快捷键 | 操作 |
| --- | --- |
| `Alt+h/j/k/l` | 左/下/上/右切换窗格，边缘可跨标签页 |
| `Alt+方向键` | 同上 |
| `Alt+n` | 新建窗格 |
| `Alt+f` | 显示或隐藏浮动窗格 |
| `Alt++/-` | 增大/缩小窗格 |
| `Alt+[/]` | 上一个/下一个交换布局 |
| `Alt+i/o` | 标签页向左/右移动 |

### Pane 模式：`Ctrl+P`

| 按键 | 操作 |
| --- | --- |
| `h/j/k/l` 或方向键 | 切换窗格 |
| `n` | 新建窗格 |
| `r` | 向右新建窗格 |
| `d` | 向下新建窗格 |
| `s` | 新建堆叠窗格 |
| `w` | 切换浮动窗格 |
| `f` | 当前窗格全屏 |
| `c` | 重命名窗格 |
| `x` | 关闭窗格 |

### Tab 模式：`Ctrl+T`

| 按键 | 操作 |
| --- | --- |
| `n` | 新建标签页 |
| `h/k/←/↑` | 上一个标签页 |
| `j/l/→/↓` | 下一个标签页 |
| `1`–`9` | 跳到指定标签页 |
| `r` | 重命名标签页 |
| `s` | 当前标签页同步输入 |
| `x` | 关闭标签页 |
| `Tab` | 在最近两个标签页间切换 |

### Scroll 与 Session

| 快捷键 | 操作 |
| --- | --- |
| `Alt+S` 后 `s` | 输入搜索内容 |
| Scroll 模式 `e` | 在 Neovim 中编辑回滚内容 |
| Scroll 模式 `j/k` | 向下/向上滚动 |
| Scroll 模式 `d/u` | 向下/向上滚动半页 |
| `Ctrl+O` 后 `w` | 打开 Session Manager |
| `Ctrl+O` 后 `l` | 打开 Layout Manager |
| `Ctrl+O` 后 `d` | detach 当前会话 |

## Yazi

| 快捷键 | 操作 |
| --- | --- |
| `Enter` | 按文件类型打开；文本和 JSON 进入 Neovim |
| `g h` | 主目录 |
| `g c` | `~/.config` |
| `g d` | `~/Downloads` |
| `g p` | `~/Documents/Programs` |
| `R` | 在 Finder 中显示当前项 |
| `q` | 退出；通过 `y` 启动时同步最后目录到 Shell |

## LazyVim

### 查找与文件

| 快捷键 | 操作 |
| --- | --- |
| `Cmd+P` | VS Code 风格：在项目根目录查找文件 |
| `Cmd+Shift+P` | VS Code 风格：打开命令面板 |
| `Cmd+Shift+F` | VS Code 风格：在项目中全文搜索 |
| `Cmd+B` | VS Code 风格：显示或隐藏项目文件浏览器 |
| `<Space><Space>` / `<Space>ff` | 在项目根目录查找文件 |
| `<Space>fF` | 在当前目录查找文件 |
| `<Space>fg` | 查找 Git 已跟踪文件 |
| `<Space>fr` | 最近文件 |
| `<Space>fb` / `<Space>,` | Buffer 列表 |
| `<Space>e` | 项目根目录文件浏览器 |
| `<Space>E` | 当前目录文件浏览器 |
| `<Space>/` / `<Space>sg` | 在项目中全文搜索 |
| `<Space>sG` | 在当前目录全文搜索 |
| `<Space>sw` | 搜索光标下单词或选中内容 |
| `<Space>sk` | 搜索并查看全部快捷键 |
| `<Space>?` | 查看当前 Buffer 快捷键 |

### 编辑、Buffer 与窗口

| 快捷键 | 操作 |
| --- | --- |
| `Cmd+S` | VS Code 风格：保存文件 |
| `Cmd+Z` / `Cmd+Shift+Z` | 撤销/重做；支持 Normal、Insert、Visual、Select |
| Normal `u` / `Ctrl+R` | Neovim 原生撤销/重做 |
| `Cmd+/` | VS Code 风格：注释或取消注释 |
| `Alt+Z` | VS Code 风格：切换自动换行 |
| `Shift+Alt+↑/↓` | VS Code 风格：向上/向下复制当前行或选区 |
| Insert `Shift+Enter` | 在当前行下方插入新行 |
| Insert `Cmd+Shift+Enter` | 在当前行上方插入新行 |
| Insert `Cmd+H/L` | 移动到物理行首/行尾 |
| Insert `Tab` | snippet/AI 优先，否则跳出括号、引号、标签或标点 |
| Insert `Shift+Tab` | 跳到上一个 snippet、反向跳出或取消缩进 |
| Visual `Tab` | 缩进选中行并保持选区 |
| Visual `Shift+Tab` | 取消选中行缩进并保持选区 |
| `Ctrl+S` | 保存文件 |
| `S` | Flash Treesitter 跳转 |
| `s` | Flash 精确跳转 |
| `Shift+H/L` | 上一个/下一个 Buffer |
| `<Space>bd` | 删除当前 Buffer |
| `<Space>bo` | 删除其他 Buffer |
| `Ctrl+H/J/K/L` | 切换 Neovim 窗口 |
| Normal `Ctrl+Cmd+H/L` | 将竖向分隔线左移/右移 2 列 |
| Normal `Ctrl+Cmd+J/K` | 将横向分隔线下移/上移 2 行 |
| `<Space>-` | 下方分割窗口 |
| `<Space>\|` | 右侧分割窗口 |
| `<Space>wd` | 关闭窗口 |
| `Alt+J/K` | 下移/上移当前行或选区 |
| `<Space>cf` | 手动格式化当前文件或选区 |
| `<Space>uf` | 切换全局保存时格式化 |

窗口调整优先移动当前窗口右侧/下侧的分隔线，没有时移动左侧/上侧。
对应方向没有分屏时不操作；窗口达到最小尺寸后停止移动。
Snacks 文件栏会调整整个侧栏容器，其他浮动窗口不参与。

### LSP 与诊断

以下快捷键在对应语言服务器连接后生效。

| 快捷键 | 操作 |
| --- | --- |
| `Cmd+.` | VS Code 风格：Code Action / Quick Fix |
| `F2` | VS Code 风格：重命名符号 |
| `F12` | VS Code 风格：跳到定义 |
| `Shift+F12` | VS Code 风格：查找引用 |
| `Cmd+Shift+O` | VS Code 风格：当前文件符号 |
| `gd` | 跳到定义 |
| `gr` | 查找引用 |
| `gI` | 跳到实现 |
| `gy` | 跳到类型定义 |
| `gD` | 跳到声明；TypeScript 中为源定义 |
| `K` | 悬浮文档 |
| `gK` | 函数签名帮助 |
| `<Space>ca` | Code Action |
| `<Space>cr` | 重命名符号 |
| `<Space>cR` | 重命名文件；Rust 中为 Code Action |
| `<Space>co` | 整理 imports |
| `<Space>cl` | LSP 信息 |
| `<Space>cd` | 当前行诊断 |
| `[d` / `]d` | 上一个/下一个诊断 |
| `[e` / `]e` | 上一个/下一个错误 |
| `<Space>xx` | 打开项目诊断列表 |
| `<Space>xX` | 打开当前 Buffer 诊断列表 |

### Git、终端与插件

| 快捷键 | 操作 |
| --- | --- |
| `<Space>ac` / `:Codex` | 打开/隐藏当前项目的 Codex 右侧面板 |
| `<Space>ar` / `:CodexResume` | 打开/隐藏 Codex 历史会话选择器面板 |
| Codex 面板快速连按两次 `Esc`，再按 `q` | 返回终端 Normal 模式并隐藏面板 |
| `]h` / `[h` | 下一个/上一个 Git hunk |
| `<Space>ghs` | 暂存 hunk |
| `<Space>ghr` | 重置 hunk |
| `<Space>ghp` | 预览 hunk |
| `<Space>ghb` | 当前行 blame |
| `<Space>gs` | Git 状态 |
| `<Space>gd` | Git diff |
| `Ctrl+/` | 显示或隐藏项目根目录终端 |
| `<Space>ft` | 项目根目录浮动终端 |
| `<Space>l` | Lazy 插件管理器 |
| `<Space>qq` | 退出全部 Neovim 窗口 |

### 语言专用

| 语言 | 快捷键 | 操作 |
| --- | --- | --- |
| C/C++ | `<Space>ch` | 源文件与头文件切换 |
| TypeScript | `gR` | 当前文件的全部引用 |
| TypeScript | `<Space>cM` | 添加缺失 imports |
| TypeScript | `<Space>cD` | 修复全部诊断 |
| TypeScript | `<Space>cV` | 选择 TypeScript 版本 |
| Python | `<Space>cv` | 选择虚拟环境 |
| Java | `<Space>cxv` | 提取变量 |
| Java | `<Space>cxc` | 提取常量 |
| Java | `<Space>co` | 整理 imports |
| Rust | `<Space>cR` | Rust Code Action |
| Rust | `<Space>dr` | 选择可调试目标 |
| Markdown | `<Space>cp` | 切换浏览器 Markdown 预览 |
| Markdown | `<Space>um` | 切换编辑器内 Markdown 渲染 |
