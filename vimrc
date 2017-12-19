" vundel {
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'emmet.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'php.vim'
Plugin 'vim-scripts/netrw.vim'
Plugin 'othree/html5.vim'
Plugin 'gorodinskiy/vim-coloresque.git'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'suan/vim-instant-markdown'
Plugin 'The-NERD-tree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shutnik/jshint2.vim'
Plugin 'The-NERD-Commenter'
Plugin 'Auto-Pairs'
Plugin 'node.js'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'othree/yajs.vim'
Plugin '907th/vim-auto-save'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'Yggdroot/indentLine'
"Plugin 'Valloric/YouCompleteMe'

"Plugin 'ternjs/tern_for_vim' 
"Plugin 'scrooloose/syntastic'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'isRuslan/vim-es6' 
"Plugin 'jQuery'
"Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'

call vundle#end()            " required
filetype plugin indent on    " required

" }

"代码提示
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"tern_for_vim
"autocmd FileType javascript setlocal omnifunc=tern#Complete

autocmd BufRead,BufNewFile *.vue set filetype=html "设置vue文件模式为html

"编码设置(windows airline)
set encoding=utf-8
set t_Co=256  
set laststatus=2  
set lazyredraw  
let g:airline#extensions#tabline#enabled = 1 "buffers
let g:airline_theme="oceanicnext" 
let g:airline_powerline_fonts=1  
if !exists('g:airline_symbols')  
  let g:airline_symbols={}  
endif
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

let g:airline_left_sep         = ''
let g:airline_left_alt_sep     = ''
let g:airline_right_sep        = ''
let g:airline_right_alt_sep    = ''
let g:airline_symbols.branch   = 'BR:'
let g:airline_symbols.readonly = 'Lk'
let g:airline_symbols.linenr   = 'LN:'


"常规配置
set runtimepath+=~/.vim/ "设置运行时目录(针对于UltiSnips)
set number
syntax on
syntax enable
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set shortmess=atI
set nocompatible
set incsearch
set hls
set ic
set fileformat=unix "防止window下的doc文件出现^M报错
let &termencoding=&encoding
set fileencodings=utf-8,gbk
set backspace=indent,eol,start
set wildignore=node_modules/*,.git/* " 设置vimgrep搜索忽略项
"set guicursor=n-v-c:ver1,i-ci:ver1 "改变游标样式
set hidden "切换文件时保存撤销步骤
set vb t_vb= "关闭声音
set noswapfile "不生成swp文件
au GuiEnter * set t_vb= "关闭闪烁报错
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

set iskeyword=@,48-57,_,192-255,-,#,^. " 单词位移时候指定是否为单词

if (has("termguicolors"))
  set termguicolors
endif
colorscheme OceanicNext " 主题
"color hybrid

"判断操作系统
if has('win32')
  "windows 透明设置
  " if executable("vimtweak.dll") "默认打开透明
  " 	autocmd guienter * call libcallnr("vimtweak","SetAlpha",226) 
  " endif 
  map <leader>W :call libcallnr("vimtweak.dll","SetAlpha",255)<cr>
  map <leader>w :call libcallnr("vimtweak.dll","SetAlpha",226)<cr>
  set guifont=yaHei_consolas_hybrid:h12
  "set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI:qDRAFT
  autocmd GUIEnter * simalt ~x "全屏
  "解决菜单乱码 (window)
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  language messages zh_CN.utf-8
elseif has('unix')
  set guifont=mono\ 11
elseif has('mac')
  set guifont=mono\ 11
endif

"关闭菜单栏
if has("gui_running")
  set guioptions-=m 
  set guioptions-=T 
  set guioptions-=L 
  set guioptions-=r 
  set guioptions-=b 
  set showtabline=0 
  colorscheme OceanicNext
endif

"UltiSnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit           = "vertical"

"%匹配html标签
runtime macros/matchit.vim  

"markdown实时刷新
let g:instant_markdown_slow = 1

"nerdtree快捷键
map <F8> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree "自动打开nerdtree

"html5插件：自动换行缩进(以下是不需要换行得标签)
let g:html_exclude_tags = ['html', 'style', 'script', 'body']

"进入项目目录
cd e:\work\admin-manager

" taglist
map <F7> :TlistToggle<CR>
let g:Tlist_Use_Right_Window=1

"js库高亮
let g:used_javascript_libs = 'jquery,vue'

" ctrlP
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|png|jpg|ico)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

