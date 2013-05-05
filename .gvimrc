"-----------------------------------------------------------------------------
" VIM GUI CONFIGURATION FILE
"-----------------------------------------------------------------------------
" Zhuo Tan
" ztancs@gmail.com
" 2012-06-09 Sat 12:27 AM
"-----------------------------------------------------------------------------
" background
set transparency=10

" hide toolbar
set guioptions-=T
" show toolbar
" set guioptions+=T

" hide scroll bar
set guioptions-=r
set guioptions-=L

" font setting
" other choices: Monaco, Monospace, Consolas
set guifont=Inconsolata:h16
" MacVim: smooth fonts.
set antialias 

" choose color scheme

if has("gui_running")
    colorscheme desertEx
" colorscheme solarized
" set background=light
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
else
    colorscheme default 
endif 

" " nice tex color choices are: moria, wombat, jellybeans, neon, settlemyer
" " tabula, tango2, zenburn, hemisu
" autocmd FileType tex colorscheme moria
" autocmd FileType matlab colorscheme desertEx 
" autocmd FileType r colorscheme summerfruit256 
" autocmd FileType mkd set background=light 
" autocmd FileType mkd colorscheme solarized

" size of window
set lines=70 columns=100
set textwidth=78
