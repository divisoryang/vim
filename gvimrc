" color scheme
color solarized
set background=dark

" 如果是新窗口， 就显示文件列表
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowBookmarks=1 "一直显示书签
let NERDTreeChDirMode=2 "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
" 按 <F7> 出目录
nmap <silent> <F7> :NERDTreeToggle<CR>
" 隐藏工具栏
set guioptions-=T
" 显示行号
set number
" 字体
set guifont=Inconsolata
" 设置空白字符的显示
set list listchars=tab:→\ ,trail:·
" 导出 html 设置
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

" CTRL-C  are Copy
vnoremap <C-C> "+y
" CTRL-V are Paste
map <C-V>	"+gP
cmap <C-V> <C-R>+
imap <C-V> <C-R>+


" 窗口区域切换,Alt+↑↓←→  来切换
" 因为mac os x lion 定义了Ctrl+←→
imap <silent> <A-left> <esc><C-W><left>
vmap <silent> <A-left> <esc><C-W><left>
nmap <silent> <A-left> <C-W><left>
imap <silent> <A-right> <esc><C-W><right>
vmap <silent> <A-right> <esc><C-W><right>
nmap <silent> <A-right> <C-W><right>
imap <silent> <A-up> <esc><C-W><up>
vmap <silent> <A-up> <esc><C-W><up>
nmap <silent> <A-up> <C-W><up>
imap <silent> <A-down> <esc><C-W><down>
vmap <silent> <A-down> <esc><C-W><down>
nmap <silent> <A-down> <C-W><down>

map <C-n> :NERDTreeToggle<CR>
