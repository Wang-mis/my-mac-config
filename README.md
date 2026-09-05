# My Mac Config

macOS 终端开发环境说明与 Neovim 配置源。

## 内容

- [`docs/configuration.md`](docs/configuration.md)：终端、Shell、命令行工具、
  Zellij、Yazi 与 LazyVim 的完整配置说明。
- [`docs/shortcuts.md`](docs/shortcuts.md)：Ghostty、Zellij、Yazi、Shell 和
  LazyVim 常用快捷键速查。
- [`nvim/`](nvim/)：由 Git 管理的 LazyVim 配置，设计为链接到
  `~/.config/nvim`。
- [`zellij/config.kdl`](zellij/config.kdl)：Zellij 配置副本。
- [`zsh/zellij.zsh`](zsh/zellij.zsh)：`za`、`zl` 和 Zellij 会话名 Tab 补全。
- [`scripts/link-nvim.sh`](scripts/link-nvim.sh)：在新机器上备份已有配置并
  建立 Neovim 配置链接。

## 安装 Neovim 配置

```bash
git clone https://github.com/Wang-mis/my-mac-config.git ~/Documents/Programs/my-mac-config
cd ~/Documents/Programs/my-mac-config
./scripts/link-nvim.sh
nvim --headless "+Lazy! sync" +qa
```

脚本不会直接删除已有的 `~/.config/nvim`。如果目标已经存在且不是本仓库的
链接，它会先将目标重命名为带时间戳的备份目录。

## 加载 Zellij Shell 配置

安装 Zellij 后，在 `~/.zshrc` 加载 Oh My Zsh 的语句之后加入：

```zsh
source "$HOME/Documents/Programs/my-mac-config/zsh/zellij.zsh"
```

仓库路径不同时调整上述路径。不使用 Oh My Zsh 时，先运行
`autoload -Uz compinit; compinit` 初始化补全。不要重复保留旧的
`za`、`_za`、`compdef _za za` 和 `zl` 定义。

重新打开终端后，`za` 连接或创建当前目录同名会话，`zl` 列出会话；
输入 `za ` 或会话名前缀后按 `Tab`，动态补全已有会话名。

## 安装 Zellij 配置

先备份现有配置，再将仓库中的配置复制到活动位置：

```bash
mkdir -p ~/.config/zellij
cp ~/.config/zellij/config.kdl ~/.config/zellij/config.kdl.backup
cp zellij/config.kdl ~/.config/zellij/config.kdl
```

布局设置仅在新建会话时加载。修改配置后，已有会话需要退出并重新创建，
或者另建一个会话检查效果。

## 维护

修改 `~/.config/nvim` 会直接修改本仓库的 `nvim/`，因为活动配置通过符号
链接指向这里。更新插件后，应一并提交 `nvim/lazy-lock.json`，确保其他机器
复现相同插件版本。

```bash
git status
git add nvim zellij zsh docs README.md scripts .gitignore
git commit -m "Update macOS development configuration"
git push
```
