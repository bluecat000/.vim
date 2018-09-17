set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'emmet.vim'
Plugin 'othree/html5.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'posva/vim-vue'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ternjs/tern_for_vim' 
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'mileszs/ack.vim'
Plugin 'Auto-Pairs'
Plugin 'The-NERD-tree'
Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'roxma/nvim-yarp' "vim required
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'gorodinskiy/vim-coloresque.git'
" Plugin 'Yggdroot/indentLine'
" Plugin 'php.vim'
" Plugin 'node.js'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'dkprice/vim-easygrep'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'othree/yajs.vim'
call vundle#end()            " required
filetype plugin indent on    " required

"常规配置
" set shortmess=atI "启动不出现提示语
set encoding=utf-8
set t_Co=256  
set runtimepath+=~/.vim/ "设置运行时目录(针对于UltiSnips)
set number
set relativenumber
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
set cursorcolumn
set cursorline
set hidden "切换文件时保存撤销步骤
set vb t_vb= "关闭声音
set noswapfile "不生成swp文件
au GuiEnter * set t_vb= "关闭闪烁报错
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set foldmethod=indent "缩进折叠
" au BufWinLeave {*.*,.*,_vimrc} silent mkview  " 保存文件的折叠状态
" au BufRead {*.*,.*,_vimrc} silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态
set foldlevel=99 "折叠数
set iskeyword=@,48-57,_,192-255,-,#,^. " 单词位移时候指定是否为单词
set timeoutlen=1000 ttimeoutlen=0 " 间隔 调整iterm2很慢的问题

" set termguicolors
" python set
" let g:python_host_skip_check=1
" let g:python_host_prog = '/usr/local/bin/python'
" let g:python3_host_skip_check=1
" let g:python3_host_prog = '/usr/local/bin/python3'
set background=dark
color neosolarized

"代码提示
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete "tern_for_vim
autocmd BufRead,BufNewFile *.wxss set filetype=css " 小程序文件
autocmd BufRead,BufNewFile *.wxml set filetype=html " 小程序文件
autocmd BufRead,BufNewFile *.vue setlocal filetype=html
autocmd BufRead,BufNewFile *.html setlocal filetype=html.javascript.css
" let g:vue_disable_pre_processors=1
let g:used_javascript_libs = 'jquery,vue,react' "js库高亮
autocmd FileType vue syntax sync fromstart
autocmd FileType html syntax sync fromstart
let g:html_exclude_tags = ['html', 'style', 'script'] "html5插件：不需要换行的标签

"PLUGINS
"airline
" set laststatus=2  
" set lazyredraw  
" let g:airline#extensions#tabline#enabled = 1 "buffers
" let g:airline_theme="base16_atelierdune" 
" let g:airline_powerline_fonts=1  
" if !exists('g:airline_symbols')  
  " let g:airline_symbols={}  
" endif
" let g:airline#extensions#tabline#buffer_nr_show = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'default',
      \ }

"UltiSnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit           = "vertical"

"%匹配html标签
runtime macros/matchit.vim  

" nerdcommenter
let g:NERDSpaceDelims=1 "注释时候加上空格
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

"markdown实时刷新
let g:instant_markdown_slow = 1

"nerdtree
map <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " 当所有文件关闭时关闭项目树窗格
let NERDTreeIgnore=['\~$', 'node_modules'] " 不显示这些文件
let NERDTreeMinimalUI=1 " 不显示项目树上额外的信息，例如帮助、提示什么的

" emmet
let g:user_emmet_settings = {
      \    'html': {
      \        'empty_element_suffix': ' />',
      \    },
      \}

" ctrlP
" let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ale 语法检测
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'html': ['eslint'],
      \}
nnoremap <leader>aj :ALENext<CR>
nnoremap <leader>ak :ALEPrevious<CR>


" jump to def
nnoremap <leader>d :TernDef<CR>
nnoremap <leader>r :TernRefs<CR>
nnoremap <leader>h :TernDoc<CR>


" gitgutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'

" deoplete
set runtimepath+=~/.vim/bundle/deoplete.nvim/
set pumheight=5 "补全候选词高度
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#guess = 0
let g:deoplete#sources#ternjs#sort = 0
let g:deoplete#sources#ternjs#expand_word_forward = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#in_literal = 0
let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ 'typescript',
      \ 'html'
      \ ]

"vue
" function! s:setFileType()
" if searchpair('<script', '', '</script>', 'bnW')
" set ft=javascript
" elseif searchpair('<style', '', '</style>', 'bnW')
" set ft=css
" else
" set ft=html
" endif
" endfunction

" augroup vueBinds
" au!
" au InsertEnter *.vue call s:setFileType()
" augroup END

" Function: display errors from Ale in statusline
" function! LinterStatus() abort
   " let l:counts = ale#statusline#Count(bufnr(''))
   " let l:all_errors = l:counts.error + l:counts.style_error
   " let l:all_non_errors = l:counts.total - l:all_errors
   " return l:counts.total == 0 ? '' : printf(
   " \ 'W:%d E:%d',
   " \ l:all_non_errors,
   " \ l:all_errors
   " \)
" endfunction
" set laststatus=2
" set statusline=
" set statusline+=\ %l
" set statusline+=\ %*
" set statusline+=\ ‹‹
" set statusline+=\ %f\ %*
" set statusline+=\ ››
" set statusline+=\ %m
" set statusline+=\ %F
" set statusline+=%=
" set statusline+=\ %{LinterStatus()}
" set statusline+=\ ‹‹
" set statusline+=\ ::
" set statusline+=\ %n
" set statusline+=\ ››\ %*

" statusline2
" function! GitBranch()
  " return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
  " let l:branchname = GitBranch()
  " return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#
" set statusline+=\ %f
" set statusline+=%m\
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" set statusline+=\ 

