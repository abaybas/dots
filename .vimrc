set nocompatible
set more
set laststatus=2
syntax on
set smartindent
set incsearch
imap jj <esc>`^
colorscheme desert
highlight StatusLine guifg=White guibg=#008888
highlight CursorLine guibg=Grey5
highlight DiffText guibg=#993333
set guioptions-=m
set guioptions-=T
set autochdir
:map   <F5> :ls<CR>:e #
:map   <F4> :e #<CR>
:map   <F6> :b#<CR>:bd #<CR>
"set guifont=Andale_Mono:h9:cANSI

set shiftwidth=4
set ignorecase
set smartcase
set smarttab
set tabstop=4
set expandtab
set cursorline
set number
set backspace=indent,eol,start

nmap ,d :diffthis<cr> 
nmap ,D :diffoff!<cr>

nmap ,m <C-W>_<C-W>\|
nmap ,q ^
nmap ,r $
nmap ,cd :lcd %:p:h<CR>
nmap <C-TAB> <C-W><C-W>
nmap <S-TAB> <C-W>p
nmap ,n :nohlsearch<CR>
set grepprg=grep\ -E\ -r\ -n\ -I
set visualbell

" Search for selected text in visual mode with */#
" effect: overrides unnamed register
" Simplest version: vnoremap * y/<C-R>"<CR>
" Better one: vnoremap * y/\V<C-R>=escape(@@,"/\\")<CR><CR>
" This is so far the best, allowing all selected characters and multiline selection:
" Atom \V sets following pattern to "very nomagic", i.e. only the backslash has special meaning.
" As a search pattern we insert an expression (= register) that
" calls the 'escape()' function on the unnamed register content '@@',
" and escapes the backslash and the character that still has a special
" meaning in the search command (/|?, respectively).
" This works well even with <Tab> (no need to change ^I into \t),
" but not with a linebreak, which must be changed from ^M to \n.
" This is done with the substitute() function.
vnoremap * y/\V<C-R>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<CR><CR>
vnoremap # y?\V<C-R>=substitute(escape(@@,"?\\"),"\n","\\\\n","ge")<CR><CR>
noremap <f2> :bprev<CR> 
noremap <f3> :bnext<CR> 
noremap <f7> :lnext<CR>
noremap <S-f7> :lNe<CR>

let g:ctags_statusline=1	" To show tag name in status line.
let generate_tags=1	" To start automatically when a supported

