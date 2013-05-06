"-----------------------------------------------------------------------------
" VIM CONFIGURATION FILE
"-----------------------------------------------------------------------------
" Zhuo Tan
" ztancs@gmail.com
" created 2012-04-05 Thu 02:25 PM
" modified 2013-05-05 Sun 12:02 AM 
"-----------------------------------------------------------------------------
" VBUNDLES 
" use vbundle and github to manage plugins
" https://github.com/gmarik/vundle 

" use vim settings, rather than vi settings
" this must be first
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" MY BUNDLES HERE:
" 
" original repos on github
Bundle 'sgeb/vim-matlab'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'flazz/vim-colorschemes'
Bundle 'jcf/vim-latex'
Bundle 'klen/python-mode'
Bundle 'vim-pandoc/vim-pandoc'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'ctrlp.vim'
Bundle 'EasyMotion'
Bundle 'Vim-R-plugin'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"-----------------------------------------------------------------------------
" GENERAL SETTINGS
" this section is largely based on 'A BITE OF VIM'
" see http://www.swaroopch.org/notes/Vim

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
" PLUGINS SETTINGS

" Use Marked.app to preview markdown files: \\p to preview
"
" http://stackoverflow.com/questions/9212340/is-there-a-vim-plugin-for-preview-markdown-file
function! s:setupMarkup()
  nnoremap <leader><leader>p :silent !open -a Marked.app '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" vim-matlab
"
" https://github.com/sgeb/vim-matlab
" According to http://www.vim.org/scripts/script.php?script_id=2407, do:
" $ mkdir ftplugin
" $ mkdir indent
" $ mkdir compiler
" $ cp ~/.vim/bundle/vim-matlab/ftplugin/matlab.vim ~/.vim/ftplugin/
" $ cp ~/.vim/bundle/vim-matlab/indent/matlab.vim ~/.vim/indent/
" $ cp ~/.vim/bundle/vim-matlab/compiler/mlint.vim ~/.vim/compiler/
source $VIMRUNTIME/macros/matchit.vim 
filetype indent on
autocmd BufEnter *.m compiler mlint
 
" vim-latex
"
" Use: \ll to compile, \lv to view pdf; \ls doesn't work
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
let $PATH = $PATH.":/usr/texbin"
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" The following settings are based on
" www.charlietanksley.net/philtex/vim-latex/
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf='Skim'
let g:Tex_ViewRule_dvi='Skim'
let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_Folding=0

" enable forward search and inverse search
" http://molecularclouds.blogspot.com/2012/01/latex-vim-skim.html
" to use:
" forward search: ,m command will reload the file and put your cursor where the text is
" forward search: ,t will return VIM to the front afterwards
" inverse search: cmd + shift + click
" activate skim
map ,v :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
map ,p :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
map ,m :w<CR>:silent !make <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>

" reactivate vim
map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
map ,t :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
