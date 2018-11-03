set nocompatible                " choose no compatibility with legacy vi
""filetype plugin indent on       " load file type plugins + indentation - had to disable for Vuldle install
filetype off


"""""""""" plugins """"""""
"""""""""""""""""""""""""""
so ~/.vim/plugins.vim

set timeout ttimeoutlen=50
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
"" Numbers
set relativenumber
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree','tlist']
"
"Leader
let mapleader = ","
"""""

" undo remapped to shift u for using ext keyboard
map <S-u> :u<cr>

cnoreabbrev W w
"inoremap nn <Esc>`^
"imap <S-> <Esc>
"imap nn <Esc>
""" Nerdtree """
map <Leader>1 <Esc>:NERDTreeToggle<cr> 
"let NERDTreeShowHidden=1

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



map <Leader>e ci'
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

" From https://dougblack.io/words/a-good-vimrc.html
" space open/closes folds
nnoremap <space> za
" highlight last inserted text
nnoremap gV `[v`]
" save session
"nnoremap <leader>s :mksession<CR>
"
" CtrlP settings
"let g:ctrlp_map = '<c-q>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


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
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['jslint', 'phpcs', 'phpmd']

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
set hidden
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
nnoremap \l       : list buffers
nnoremap \b \f \g : go back/forward/last-used

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"let c = 1
"while c <= 99
"  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
"  let c += 1
"endwhile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow								 "Make splits default to below...
set splitright 								 "And to the right. This feels more natural.
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark
colorscheme gruvbox
let php_folding=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autosourcing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup autosourcing
	autocmd!
	autocmd FileType c setlocal foldmethod=syntax
	autocmd BufWritePost .vimrc source %
augroup END

"imap ;; <Esc>`^

"mouse support - don't ever enable it
"set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoclose quotes, brackets, etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"disable autocomplete for largefiles
map <Leader>z :let g:ycm_largefile=1
map <Leader>x :unlet g:ycm_largefile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this sets tabs at 4 spaces
""set noet ci pi sts=0 sw=4 ts=4
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
inoremap <Leader>= <C-o>:syntax sync fromstart<CR>
set langmap=hk,jh,kj
""set langmap=hk,j`,kj,`h
nnoremap K L
