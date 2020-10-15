"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable the beeping and flash if an error occurs.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => If the rust language server is availbe, start it
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rls')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'rls',
            \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
            \ 'whitelist': ['rust'],
            \ })
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General layout configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show the line number
set number relativenumber

" Load the colorscheme
colorscheme nord

filetype plugin indent on

" Configure the GUI vim interface
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Font settings
set guifont=JetBrains_Mono:h9:cANSI:qDRAFT

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Split settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navidation to CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting the split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS specific terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32')
	set shell=\"C:\\Program\ Files\\PowerShell\\7\\pwsh.exe\"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal in Vim in a vertical split
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>tt :vertical :term<CR>

