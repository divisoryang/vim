" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 文件 UTF-8 编码
set fileencoding=utf-8
" 正确地处理中文字符的折行和拼接
set formatoptions+=mM

"备份文件
set backup
set writebackup
set backupdir=~/.tmp

" 不要生成swap文件
set noswapfile

set history=50			" keep 50 lines of command line history
set nu					" show line number
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set incsearch			" do incremental searching
set cindent				" 使用C语言的规则自动缩进，当你敲回车时会自动缩进，所有类C语言（PHP，JAVA）都试用，比smartindent更智能
set autoindent			" always set autoindenting on
set tabstop=4
set shiftwidth=4
set softtabstop=4		" 方便开启了expandtab后每次退格键删除x个空格

"pathogen
call pathogen#infect()
set rtp+=~/.vim/bundle/vundle

" Vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" nerdtree
Bundle 'scrooloose/nerdtree'

" comment plugin
Bundle 'scrooloose/nerdcommenter'

" airline
Bundle 'bling/vim-airline'

" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
" set YouCompleteMe trigger key 
let g:ycm_key_list_previous_completion=['<Up>']
" disable scratch window
set completeopt=menu,menuone
"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动添加删除go import
Bundle 'cespare/vim-golang'
autocmd BufWritePre *.go :Fmt	" 写入go文件前把import修正

" 显示go函数定义
Bundle 'dgryski/vim-godef'

" go 自动补全
Bundle 'Blackrush/vim-gocode'

if has("mac") || has("macunix")
	filetype off
	filetype plugin indent off
	set runtimepath+=~/src/go/misc/vim
	set runtimepath+=~/go/misc/vim
	filetype plugin indent on
	syntax on
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Go 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

"
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " 下面三条相当于 filetype plugin indent on
  filetype on         " 打开文件类型检测
  filetype plugin on  " 允许vim加载文件类型插件
  filetype indent on  " 允许vim为不同类型的文件定义不同的缩进格式

  " 自定义python的缩进
  autocmd FileType python setlocal expandtab shiftwidth=4  tabstop=4 softtabstop=4

  " 定义ruby的编译器
  autocmd FileType ruby compiler ruby
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分割窗口
map ws :split<cr>
map wv :vsplit<cr>

" 关闭窗口
map wc :close<cr>

" 切换分割窗口
map wn <C-w>w

" 将所选中内容复制到系统
map cy "+y

" 模仿MS Windows中的快捷键
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+p
vmap <C-v> "+p
nmap <C-a> ggvG$

" 用<C-h,j,k,l>切换到上下左右的窗口中去
nmap <A-j> <C-W>j
nmap <A-k> <C-W>k
nmap <A-h> <C-W>h
nmap <A-l> <C-W>l

nmap wj <C-W>j
nmap wk <C-W>k
nmap wh <C-W>h
nmap wl <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 括号自动补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END

    " 自动补全符号
    function! AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap ` ``<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf

    function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf

    " to close for PHP and Javascript script
    au FileType go,php,c,python,javascript exe AutoClose()
endif


Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" riv .rst 文件
Bundle 'Rykka/riv.vim'
let g:riv_fold_level = 0
let g:riv_fold_auto_update = 0
let rst_syntax_folding = 0
let g:riv_auto_fold_force = 0

au FileType rst set nofoldenable
