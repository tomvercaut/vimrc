"" info found on https://github.com/ycm-core/YouCompleteMe/issues/1751
"function! BuildYCM(info)
	"" info is a dictionary with 3 fields
	"" - name:   name of the plugin
	"" - status: 'installed', 'updated' or 'unchanged'
	"" - force:  set on PlugInstall! or PlugUpdate!
	"if a:info.status == 'installed' || a:info.force
		"!./install --rust-completer
	"endif
"endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
let g:plug_timeout=3600
call plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
"Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'racer-rust/vim-racer'
Plug 'habamax/vim-asciidoctor'


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set the fileformat to unix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileformat=unix
set fileformats=unix,dos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto reload file if it's changed externally
"    https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
au CursorHold,CursorHoldI * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable the beeping and flash if an error occurs.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set novisualbell
set vb t_vb=

if has('gui_running')
	autocmd GUIEnter * set vb t_vb=
endif

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
"colorscheme nord

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

tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" Make adjusting the split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

tnoremap <silent> <C-Left> :vertical resize +3<CR>
tnoremap <silent> <C-Right> :vertical resize -3<CR>
tnoremap <silent> <C-Up> :resize +3<CR>
tnoremap <silent> <C-Down> :resize -3<CR>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Rust Racer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
augroup Racer
	autocmd!
	autocmd FileType rust nmap <buffer> gd		<Plug>(rust-def)
	autocmd FileType rust nmap <buffer> gs		<Plug>(rust-def-split)
	autocmd FileType rust nmap <buffer> gx		<Plug>(rust-def-vertical)
	autocmd FileType rust nmap <buffer> gt		<Plug>(rust-def-tab)
	autocmd FileType rust nmap <buffer> <leader>gd	<Plug>(rust-doc)
	autocmd FileType rust nmap <buffer> <leader>gD	<Plug>(rust-doc-tab)
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => asciidoctor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'

" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 1

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END


augroup ON_ASCIIDOCTOR_SAVE | au!
    au BufWritePost *.adoc :Asciidoctor2HTML
augroup end


