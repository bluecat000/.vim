set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'emmet.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'php.vim'
Plugin 'othree/html5.vim'
Plugin 'gorodinskiy/vim-coloresque.git'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'suan/vim-instant-markdown'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'node.js'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'othree/yajs.vim'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'Yggdroot/indentLine'
Plugin 'tmhedberg/SimpylFold'
Plugin 'dkprice/vim-easygrep'
Plugin 'ternjs/tern_for_vim' 
Plugin 'Valloric/YouCompleteMe'
Plugin 'Auto-Pairs'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'Shutnik/jshint2.vim'
call vundle#end()            " required
filetype plugin indent on    " required

"常规配置
set shortmess=atI "启动不出现提示语
set encoding=utf-8
set t_Co=256  
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
set wildignore+=node_modules/*,.git/* " 设置vimgrep搜索忽略项
"set guicursor=n-v-c:ver1,i-ci:ver1 "改变游标样式
set hidden "切换文件时保存撤销步骤
set vb t_vb= "关闭声音
set noswapfile "不生成swp文件
au GuiEnter * set t_vb= "关闭闪烁报错
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set foldmethod=indent "缩进折叠
au BufWinLeave {*.*,.*,_vimrc} silent mkview  " 保存文件的折叠状态
au BufRead {*.*,.*,_vimrc} silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态
set foldlevel=99 "折叠数
set iskeyword=@,48-57,_,192-255,-,#,^. " 单词位移时候指定是否为单词
set cursorcolumn "高亮显示光标
set cursorline "高亮显示光标

if (has("termguicolors"))
  set termguicolors
endif
"colorscheme OceanicNext " 主题
set background=dark
"color hybrid
color solarized

"代码提示
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"tern_for_vim
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd BufRead,BufNewFile *.vue set filetype=html "设置vue文件模式为html

"airline
set laststatus=2  
set lazyredraw  
let g:airline#extensions#tabline#enabled = 1 "buffers
let g:airline_theme="solarized" 
let g:airline_powerline_fonts=1  
if !exists('g:airline_symbols')  
  let g:airline_symbols={}  
endif
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

"UltiSnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit           = "vertical"

"%匹配html标签
runtime macros/matchit.vim  

"markdown实时刷新
let g:instant_markdown_slow = 1

"nerdtree
map <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " 当所有文件关闭时关闭项目树窗格
let NERDTreeIgnore=['\~$', 'node_modules'] " 不显示这些文件
let NERDTreeMinimalUI=1 " 不显示项目树上额外的信息，例如帮助、提示什么的

let g:html_exclude_tags = ['html', 'style', 'script', 'body'] "html5插件：自动换行缩进(以下是不需要换行得标签)

" taglist
map <F7> :TlistToggle<CR>
let g:Tlist_Use_Right_Window=1

let g:used_javascript_libs = 'jquery,vue' "js库高亮

" ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"eslint
"let g:syntastic_javascript_checkers = ['eslint']

"ycm
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"let g:ycm_min_num_of_chars_for_completion=1 "第一个字符补全
set pumheight=10 "补全候选词高度"
let g:ycm_semantic_triggers = {
      \   'css': [ 're!^\s{2}', 're!:\s+' ],
      \ }
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

let g:NERDSpaceDelims=1 "注释时候加上空格

"键盘快捷键
"判断操作系统
if has('win32')
  "windows 透明设置
  " if executable("vimtweak.dll") "默认打开透明
  " 	autocmd guienter * call libcallnr("vimtweak","SetAlpha",226) 
  " endif 
  map <leader>W :call libcallnr("vimtweak.dll","SetAlpha",255)<cr>
  map <leader>w :call libcallnr("vimtweak.dll","SetAlpha",226)<cr>
  "set guifont=yaHei_consolas_hybrid:h12
  "set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI:qDRAFT
  set guifont=Powerline_Consolas:h13:cANSI
  set guifontwide=YaHei_Consolas_Hybrid:h13
  autocmd GUIEnter * simalt ~x "全屏
  "解决菜单乱码 (window)
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  language messages zh_CN.utf-8
  "进入项目目录
  "cd e:\work\appweb
  "cd e:\work\admin-manager
  cd e:\work\webmanager2.0-website
elseif has('unix')
  "set guifont=mono\ 11
  "let g:airline_left_sep         = ''
  "let g:airline_left_alt_sep     = ''
  "let g:airline_right_sep        = ''
  "let g:airline_right_alt_sep    = ''
  "let g:airline_symbols.branch   = 'BR:'
  "let g:airline_symbols.readonly = 'Lk'
  "let g:airline_symbols.linenr   = 'LN:'
  "let g:airline_symbols.maxlinenr = ' COL'
  "cd work/
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'
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
  let g:airline_theme="solarized" 
endif

"let g:AutoPairs={}
