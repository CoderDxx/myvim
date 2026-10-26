" =============================================================================
" vim-plug插件管理
" =============================================================================
call plug#begin('~/.vim/plug')

" vim中文帮助手册
Plug 'yianwillis/vimcdoc'
" C++语法高亮增强
Plug 'octol/vim-cpp-enhanced-highlight'
" 最近打开的文件维护插件
Plug 'vim-scripts/mru.vim'
" 状态栏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Taglist插件
Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
" 树形目录插件
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 代码补齐插件
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" 代码补齐模板
Plug 'honza/vim-snippets'

" 异步静态代码检查
"Plug 'w0rp/ale', { 'for': ['s', 'S', 'c', 'h', 'C', 'cpp', 'cc', 'cxx', 'py', 'go', 'java', 'js', 'php', 'sh', 'conf', 'vimrc', 'bashrc', 'config', 'ini', 'mk', 'makefile', 'Makefile'] }

" 括号补全
Plug 'jiangmiao/auto-pairs'
"彩虹括号
Plug 'luochen1990/rainbow'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

" 主题配色
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'jpo/vim-railscasts-theme'
Plug 'tpope/vim-vividchalk'
Plug 'joshdick/onedark.vim'

call plug#end() 

" =============================================================================
" 编码相关
" =============================================================================
set termencoding=utf-8  " 设置终端显示编码
set encoding=utf-8      " 设置vim内部编码
" 菜单显示编码
set langmenu=zh_CN.UTF-8
" 设置可识别文件编码列表
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936,utf-16,big5,latin1   

" =============================================================================
" 基本配置
" =============================================================================
" 开启文件类型检查,根据不同的文件类型加载不同的插件采用不同的缩进
filetype plugin indent on
syntax on               " 打开语法高亮
set t_Co=256            " 启用256色
set nocompatible        " 不与vi兼容(采用vim自己的操作命令) 
set background=dark     " 设置背景色
set cursorline          " 高亮光标所在行
set cursorcolumn        " 高亮光标所在列"
" 高亮行颜色
highlight CursorLine cterm=Bold ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE
" 高亮列颜色
highlight CursorColumn cterm=Bold ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE
"设置主题配色
"colorscheme gruvbox
"colorscheme janah
"colorscheme jellybeans
colorscheme molokai
"colorscheme railscasts
"colorscheme vividchalk
"colorscheme onedark
"colorscheme desert
"colorscheme torte
"colorscheme ron
set number              " 显示行号
set laststatus=2        " 是否显示状态栏(0,1,2)
set ruler               " 在状态栏显示当前光标坐标
set showmode            " 底行显示当前处于哪种模式
set showcmd             " 命令模式下,在底行显示键入的指令
set mouse=vh           " 鼠标模式(n,v,i,c,h,a,r,A)
set scrolloff=7         " 垂直滚动时光标距离顶部/底部的行数
set sidescrolloff=7     " 水平滚动时光标距离边缘的字符数
"set showmatch           " 插入括号时短暂跳转到对应的另一个括号
set nobackup            " 不创建备份文件
set noerrorbells        " 出错时不要发出声音
"set visualbell          " 出错时发出视觉提示(通常时屏幕闪烁)
set history=1024        " 记录历史操作的数量
set autoread            " 打开文件监视,如果在编辑中的文件被外部修改则提示
set autowrite           " 跳转时自动保存
" 文件换行符检测列表
set fileformats=unix,dos,mac
set foldenable          " 默认折叠
set foldmethod=marker   " 折叠方式
set guioptions-=T       " gvim不包含工具栏
set guioptions-=m       " gvim不使用菜单栏
set guioptions-=r       " gvim不显示右边滚动条
set guioptions-=l       " gvim不显示左边滚动条
set helpheight=10       " 帮助窗口的最小高度
set helplang=cn,en      " 帮助手册语言
set hidden              " 允许在有未保存的修改时切换缓冲区
set nowrap              " 不自动折行
set helplang=cn         " 中文帮助优先
"自动向上递归查找tags文件
set tags=./tags;

" =============================================================================
" 编辑相关
" =============================================================================
set tabstop=4           " 制表符宽度(Tab空格数)
set softtabstop=4       " 软制表符宽度(按Tab键和Backspace键时光标跳转的空格数)
set shiftwidth=4        " 缩进宽度(空格数)
set expandtab           " 制表符替换为空格
set autoindent          " 自动缩进
set cindent             " 特别针对C语言的自动缩进
set cinoptions=:0       " 自动缩进方案
set smartindent         " 插入新行时自动缩进
" 启用退格键删除功能
set backspace=indent,eol,start
set whichwrap=h,l       "使用指定的左右移动光标键可以移到前一行和后一行
" 自动补全模式
set complete=.,w,b,u,t,i,d
" 自动补全选项
set completeopt=longest,menu
set pumheight=10        " 自动补全菜单显示的最多项目数
" 文件和目录名补全忽略的文件
set wildignore=*.bak,*.o,*.e,*~
set wildmenu            " 命令模式下,按Tab键补全命令
" 命令补全模式
set wildmode=longest:list,full
set hlsearch            " 查找时高亮显示匹配结果
set incsearch           " 查找输入时,每输入一个字符,自动跳转到第一个匹配结果
set ignorecase          " 查找时忽略大小写
set smartcase           " 针对只有首字母时大写的查找词不忽略大小写
set paste
" =============================================================================
" 自动命令
" =============================================================================
" 打开文件光标自动跳转到上次关闭时的位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" =============================================================================
" 快捷键
" =============================================================================
" Leader键设置
let mapleader=','

" 使用分号进入命令模式
nnoremap <Space> :
vnoremap <Space> :

" 窗口切换快捷键
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

" 窗口大小调整
nnoremap + :resize +1<cr>
nnoremap _ :resize -1<cr>
nnoremap \ :vertical resize +1<cr>
nnoremap ; :vertical resize -1<cr>
 
" shell命令调用函数
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
    call system(a:Shell)
	echo 'Done!!!'
endfunction

" =============================================================================
" 插件配置
" =============================================================================
" 不加载standard-plugin，避免高亮匹配括号
let loaded_matchparen = 1

" mru.vim
" -----------------------------------------------------------------------------
" 打开mru快捷键F4
nmap  <F4> :MRU<cr>

" man.vim
" -----------------------------------------------------------------------------
" 启动man插件
source $VIMRUNTIME/ftplugin/man.vim
" man 光标定位的函数
nmap <Leader>mm :Man <C-R>=expand("<cword>")<cr><cr>
" man 2 光标定位的函数
nmap <Leader>m2 :Man 2 <C-R>=expand("<cword>")<cr><cr>
" man 3 光标定位的函数
nmap <Leader>m3 :Man 3 <C-R>=expand("<cword>")<cr><cr>

" taglist.vim
" -----------------------------------------------------------------------------
" 设置打开关闭快捷键F2
nmap  <F2> :TlistToggle<cr>
" 自动更新tags列表
let g:Tlist_Auto_Update=1
" 始终解析文件中的tag,不管taglist窗口有没有打开
let g:Tlist_Process_File_Always=1
" 当taglist窗口是最后一个窗口时退出vim
let g:Tlist_Exit_OnlyWindow=1
" 只显示一个文件的tags
let g:Tlist_Show_One_File=1
" 窗口宽度
let g:Tlist_WinWidth=30
" 只显示当前文件的tags
let g:Tlist_Enable_Fold_Column=0
" 高亮显示当前tag
let g:Tlist_Auto_Highlight_Tag=1
" 设置窗口显示在右侧
"let g:Tlist_Use_Right_Window=1
" 打开时光标定位于taglist窗口
let g:Tlist_GainFocus_On_ToggleOpen=1

" NERDTree.vim
" -----------------------------------------------------------------------------
" 设置打开关闭快捷键F3 
nmap  <F3> :NERDTreeToggle<cr>
" 窗口美化
let NERDChristmasTree=1
" 自动调整光标到窗口中心
let NERDTreeAutoCenter=1
" 指定鼠标模式(1.双击打开;2.单目录双文件;3.单击打开)
let NERDTreeMouseMode=2
" 默认显示文件
let NERDTreeShowFiles=1
" 默认显示隐藏文件
let NERDTreeShowHidden=1
" 窗口位置（'left' or 'right'）
let g:NERDTreeWinPos="right"
" 窗口宽度
let g:NERDTreeWinSize=30
" 显示行号
let g:NERDTreeShowLineNumbers=1
" 打开文件后关闭NERDTree窗口
let g:NERDTreeQuitOnOpen=1
" 高亮显示当前行目录或文件
let NERDTreeHightCursorline=1
"打开vim时如果没有文件自动打开NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE.vim
" -----------------------------------------------------------------------------
"普通模式下警告跳转快捷键
nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)
"<Leader>x触发/关闭语法检查
nmap <Leader>x :ALEToggle<CR>
"<Leader>y查看错误或警告的详细信息
nmap <Leader>y :ALEDetail<CR>
"始终开启标志列
"let g:ale_sign_column_always = 1
" 错误警告消息格式
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 文件打开时不进行检查
let g:ale_lint_on_enter = 0
" 文件修改时不进行检查
let g:ale_lint_on_text_changed = 'never'
" 文件保存时进行检查(默认)
"let g:ale_lint_on_save = 1
" 指定对应语言的检查工具
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \   'go': ['gofmt', 'golint'],
            \}
" 关闭补全功能
let g:ale_completion_enabled = 0
" 使能airline状态栏扩展
let g:airline#extensions#ale#enabled = 1
" 禁用高亮显示
"let g:ale_set_highlights = 0
" 自定义error和warning标志
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'

" airline.vim
" -----------------------------------------------------------------------------
" 设置主题
let g:airline_theme='bubblegum'
" 这个是安装字体后必须设置此项"
let g:airline_powerline_fonts = 1
" 开启标签栏
let g:airline#extensions#tabline#enabled = 1
" 标签只显示文件名忽略路径
let g:airline#extensions#tabline#fnamemod = ':t'
" 显示缓冲区编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" tabline中当前buffer两端的分隔字符
"let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
"let g:airline#extensions#tabline#left_alt_sep = '|'
" 缓冲区切换快捷键
nnoremap <Leader>. :bn<cr>
nnoremap <Leader>, :bp<cr>
nnoremap <Tab> :bn<cr>
" 关闭状态显示空白符号计数"
let g:airline#extensions#whitespace#enabled = 0
" 状态栏显示设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''

" snipmate
" ----------------------------------------------------------------------------
let g:snipMate = { 'snippet_version' : 1 }

"rainbow
" ----------------------------------------------------------------------------
let g:rainbow_active = 1


