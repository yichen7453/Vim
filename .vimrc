set nocompatible " be iMproved, required
filetype off " required

" Set the runtime path to include Vundle and initialize

" Path for Mac
set rtp+=~/.vim/bundle/Vundle.vim

" Path for Linux
" set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
" call vandle#begin(~/some/path/here)

" let Vundle manage Vundle, required
Plugin 'gmarilk/Vundle.vim'  " Mac
" Plugin 'gmarik/vundle'  " Linux

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'  "目錄樹顯示插件
Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/taglist.vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'moll/vim-bbye'
Plugin 'javacomplete'
Plugin 'Lokaltog/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" javacomplete 配置
" Only do this part when compiled with support for autocommands.
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java inoremap <buffer>. .<C-X><C-O><C-P>

" 文件類型自動識別, Vundle要求必須為off
" filetype on
filetype plugin on
filetype plugin indent on

"------------------------
" Color Scheme
"------------------------
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"------------------------
" 編輯器基本設定
"------------------------

" 默認顯示行號
set nu

" 設置(軟)製表符寬度為4：
set tabstop=4
set softtabstop=4

" 設置自動縮進：即每行的縮進值與上一行相等;使用noautoindent取消設置
set autoindent

" 設置(自動)縮進的空格數為4
set shiftwidth=4

" 設置使用C/C++語言的自動縮進方式
set cindent

" 智能縮進
set smartindent

" 在狀態欄顯示正在輸入的命令
set showcmd

" 為方便複製，用<F2>開啟/關閉行號顯示
nnoremap <F2> :set nonumber!<CR>

" 搜索的時候即時顯示結果
set incsearch

" 高亮搜索結果
set hlsearch

" 禁制循環查找
set nowrapscan

" 設置匹配模式，顯示匹配的括號
set showmatch

" 智能補全
set completeopt=longest,menu

" 標尺，用於顯示光標位置的行號和列號
set ruler

" 括號引號補全
:inoremap ( ()<ESC>i
:inoremap { {<CR>}<ESC>O
:inoremap [ []<ESC>i

" 折疊設置
set foldmethod=syntax " 用語法高亮來定義折疊
set foldlevel=100 " 啟動vim時，不要自動折疊代碼

" WinManager設置
" "NERD_Tree 集成到WinManager
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

" 設置winmanager的寬度，默認為25
let g:winNanagerWidth=30

" 窗口佈局
let g:winManagerWindowLayout='NERDTree|TagList'

" 確保delete鍵正常作用
set backspace=2

" NERDTree config
map <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * NERDTree
