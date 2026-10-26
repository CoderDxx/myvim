# myvim

Ubuntu Vim 配置。安装脚本只部署 vim-plug 和 `.vimrc`，然后打开 Vim 执行 `PlugInstall` 安装配置中的插件。

## 一键安装

前提：系统已安装 `vim`、`git`、`curl`，并可访问 GitHub 和 raw.githubusercontent.com。脚本不会安装任何系统软件，也不需要 sudo。

在 Ubuntu 的交互式 Bash 终端中执行（合并安装脚本到 main 后可用）：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/CoderDxx/myvim/main/install.sh)
```

安装内容：

- vim-plug：`~/.vim/autoload/plug.vim`
- 原始配置：`~/.vimrc`
- 插件：配置指定的 `~/.vim/plug/`

已有的 `~/.vimrc` 会先备份为 `~/.vimrc.backup.时间戳.进程号`。安装脚本保留原始配置内容。

首次打开 Vim 时，脚本使用临时配置加载插件声明，执行 `PlugInstall --sync` 后加载完整的 `~/.vimrc`，避免尚未安装主题时的启动报错。Vim 保持打开，可查看插件安装结果。退出 Vim 后删除临时文件。

若某个插件下载失败，在 Vim 中执行 `:PlugInstall` 重试；全部成功后可重新打开 Vim。再次运行脚本也可以安装缺失插件。

## 说明

按约定，脚本不安装 ctags、字体、man 手册或语言工具。Taglist 需要系统已有可兼容的 ctags；Powerline 字形需要终端已有合适字体。缺少它们时，对应功能或显示可能受限。

## 验证范围

脚本已在 Git Bash 中进行 Bash 语法检查，并用隔离的模拟命令验证安装流程、备份与下载失败处理。尚未在真实 Ubuntu 上完成联网插件安装验证。
