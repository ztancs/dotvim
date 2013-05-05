"-----------------------------------------------------------------------------
" VIM CONFIGURATION FILE
"-----------------------------------------------------------------------------
" Zhuo Tan
" ztancs@gmail.com
" created 2012-04-05 Thu 02:25 PM
" modified 2013-05-05 Sun 12:02 AM 
"-----------------------------------------------------------------------------
" GENERAL SETTINGS
" this section is largely based on 'A BITE OF VIM'
" see http://www.swaroopch.org/notes/Vim

" use pathogen and github to manage budles, see for example:
" http://lostjs.com/2012/02/04/use-pathogen-and-git-to-manage-vimfiles/
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

" use vim settings, rather than vi settings
" this must be first
set nocompatible

" show line numbers
set nu

" turn on syntax highlighting
syntax on
syntax spell toplevel

" turn on spell check
set spell
set spell spelllang=en_us
" turn off spell check
" set nospell

" highlight all matched words
set hls

" handle multiple buffer better
set hidden

" automatically indent
set smartindent

" set width of tabs to be a group of 4 spaces
" http://vimcasts.org/episodes/tabs-and-spaces/
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" minimal number of screen lines to keep above and below the cursor
set scrolloff=999

" use UTF-8
set encoding=utf-8

" status line
set laststatus=2
set statusline=
" buffer number
set statusline+=%-3.3n\
" filename
set statusline+=%f\
" status flags
set statusline+=%h%m%r%w
" file type
set statusline+=\[%{strlen(&ft)?&ft:'none'}] 
" right align reminder
set statusline+=%=
" character value
set statusline+=0x%-8B
" line, character
set statusline+=%-14(%l,%c%V%) 
" file position
set statusline+=%<%P
" show line number, cursor position
set ruler
" display incomplete commands
set showcmd

" show editing mode
set showmode
" error bells are displayed visually
set visualbell

" search options
" search as you type
set incsearch
" ignore case when searching
set ignorecase

" show auto complete menus
set wildmenu

" change to current working directory automatically
set autochdir

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" print options
set pdev=pdf
set printoptions=paper:letter,syntax:y,wrap:y,duplex:long,number:y

" save foldings
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"-----------------------------------------------------------------------------
