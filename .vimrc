"Leader
:let mapleader = ","
"""""


" undo remapped to shift u for using ext keyboard
map <S-u> :u<cr>
map u k

cnoreabbrev W w
"inoremap nn <Esc>`^
"imap <S-> <Esc>
"imap nn <Esc>
""" Nerdtree """
map <Leader>1 <Esc>:NERDTreeToggle<cr> 
"""" Tags """"
map <Leader>2 <Esc>:TlistToggle<cr> 
map <Leader>3 <Esc>:tabs<Cr>
map <Leader>4 <Esc>:EnableFastPHPFolds<Cr>
map <Leader>5 <Esc>:EnablePHPFolds<Cr>
map <Leader>6 <Esc>:DisablePHPFolds<Cr> 
map <F8> <Esc>:tabnew.<Cr> 
"map <F9> <Esc>:cd %:h<Cr> 

set pastetoggle=<F11>
set list
set scrolloff=5


""" todo-vim """
nmap <Leader>t :TODOToggle<CR>

map <Leader>k ci'
map <Leader>. ci"
map <Leader>m ci)

map <Leader>v <Esc>:vsp.<Cr><C-w><C-r>
map <Leader>h <Esc>:sp.<Cr><C-w><C-r>

" http://vimdoc.sourceforge.net/htmldoc/pattern.html#pattern
" :-)
map <Leader>r <Esc>/'\zs\<[a-zA-Z_-][a-zA-Z0-9_-]*\ze'<Cr>
"map <Leader>s <Esc>/"\zs\<\h\w*\ze"<Cr>
map <Leader>s <Esc>/"\zs\<[a-zA-Z_-][a-zA-Z0-9_-]*\ze"<Cr>
map <Leader>t <Esc>/\.\zs\<\w*<Cr>
map <Leader>a <Esc>/\<\k\w*<Cr>
map <Leader>/ <Esc>:noh<Cr>
map <Leader>q <Esc>/\<\h\w*\-*=<Cr>

set relativenumber
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree','tlist']
" From https://dougblack.io/words/a-good-vimrc.html
" space open/closes folds
nnoremap <space> za
" highlight last inserted text
nnoremap gV `[v`]
" save session
nnoremap <leader>s :mksession<CR>
"
" CtrlP settings
"let g:ctrlp_map = '<c-q>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" The following keys don't work as Alt does not work

""""""""""""""""""""""""
" Movement keys
"""""""""""""""""""""""
"map <A-n> <Left>
"map <A-i> <Right>
"map <A-e> <Down>
"map <A-u> <Up>
"imap <A-n> <Left>
"imap <A-i> <Right>
"imap <A-e> <Down>
"imap <A-u> <Up>
"map <A-h> ^
"map <A-o> $
"map <A-k> <PageDown>
"map <A-y> <PageUp>
"imap <A-h> <Home>
"imap <A-o> <End>
"imap <A-k> <PageDown>
"imap <A-y> <PageUp>
"imap <A-Space> <Esc>
"""""""""""""""""""
" Tabs keys
"""""""""""""""""""
"map <A-t><up> :tabr<cr>
"map <A-t><down> :tabl<cr>
map <A-t> :tabp<cr>""gt
map <A-s> :tabn<cr>""gT

""""""""""""""""""""
" Hack for Alt Key
""""""""""""""""""""
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
""""""""""""""""""""

set timeout ttimeoutlen=50
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
"set ts=4
set noet
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"""""""""" plugins """"""""
"""""""""""""""""""""""""""
execute pathogen#infect()

"" Manual Plugins """"

source ~/.vim/plugin/php-doc.vim
inoremap <C-b> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-b> :call PhpDocSingle()<CR>
vnoremap <C-b> :call PhpDocRange()<CR> 

"" Syntastic ""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"" Other 
set cursorline
set showmode " Display the current mode
set number "Enable line numbers
if has('statusline')
    set laststatus=2

" Broken down into easily includeable segments
    set statusline=%<%f\ " Filename
    set statusline+=%w%h%m%r " Options
    "set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y] " Filetype
    set statusline+=\ [%{getcwd()}] " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif


set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>

" buffers
:set hidden
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
nnoremap \l       : list buffers
nnoremap \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
"nnoremap <Leader>l :ls<CR>
"nnoremap <Leader>b :bp<CR>
"nnoremap <Leader>n :bn<CR>
"#nnoremap <Leader>k :b#<CR>
"#nnoremap <Leader>g :e#<CR>
"#nnoremap <Leader>1 :1b<CR>
"#nnoremap <Leader>2 :2b<CR>
"#nnoremap <Leader>3 :3b<CR>
"#nnoremap <Leader>4 :4b<CR>
"#nnoremap <Leader>5 :5b<CR>
"#nnoremap <Leader>6 :6b<CR>
"#nnoremap <Leader>7 :7b<CR>
"#nnoremap <Leader>8 :8b<CR>
"#nnoremap <Leader>9 :9b<CR>
"#nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"let c = 1
"while c <= 99
"  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
"  let c += 1
"endwhile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
set background=dark
syntax enable
let php_folding=0
autocmd FileType c setlocal foldmethod=syntax
colorscheme gruvbox

"imap ;; <Esc>`^

"mouse support - don't ever enable it
"set mouse=a
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

"disable autocomplete
map <Leader>z :let g:ycm_largefile=1
map <Leader>x :unlet g:ycm_largefile

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
"crtlp"
set runtimepath^=~/.vim/bundle/ctrlp.vim
