"""""
" remappings for when alt does not work
" undo remapped to shift u for using ext keyboard
map <S-u> :u<cr>
map u k
map <C-Space> <Esc>
map <S-q> :q<cr>
map <S-w> :w<cr>
""" Nerdtree """
map <F2> :NERDTreeToggle<cr> 
"""" Tags """"
map <F3> :TlistToggle<cr> 
map <F4> <Esc>:tabs<Cr>
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr> 
map <F8> <Esc>:tabnew.<Cr> 
map <F9> <Esc>:cd %:h<Cr> 
set pastetoggle=<F10>                                                                                                                      

""""""""""""""""""""""                                                                                                
" The following keys don't work as Alt does not work

""""""""""""""""""""""""
" Movement keys
"""""""""""""""""""""""
map <A-n> <Left>
map <A-i> <Right>
map <A-e> <Down>
map <A-u> <Up>
imap <A-n> <Left>
imap <A-i> <Right>
imap <A-e> <Down>
imap <A-u> <Up>
map <A-h> ^
map <A-o> $
map <A-k> <PageDown>
map <A-y> <PageUp>
imap <A-h> <Home>
imap <A-o> <End>
imap <A-k> <PageDown>
imap <A-y> <PageUp>
imap <A-Space> <Esc>
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
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
let php_folding=0
autocmd FileType c setlocal foldmethod=syntax

colorscheme desert
set background=dark

set timeout ttimeoutlen=50
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
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

