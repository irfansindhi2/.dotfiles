syntax enable
set nocompatible 
set clipboard+=unnamedplus
set nocompatible
filetype plugin on
set encoding=utf-8
let mapleader = " "
set modifiable
set splitbelow
set splitright
autocmd VimResized * wincmd =
set number
set t_Co=16
set notermguicolors
" highlight Comment ctermfg=Red
set background = "dark"
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>noremap <Leader>y "*y

noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

let g:airline_powerline_fonts = 1
set ttimeoutlen=50
set completeopt-=preview
set ts=4 sw=4
autocmd Filetype dart setlocal ts=2 sw=1
command! -nargs=0 Sw w !sudo tee % > /dev/null

let g:lsc_auto_map = {'defaults': v:true, 'NextReference': '<leader>n', 'PreviousReference': '<leader>p'}
map <C-n> :NERDTreeToggle<CR>

let g:vimwiki_list = [{ 'path': '~/Documents/notes/',
			\ 'syntax':'markdown', 'ext': '.md' }]

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
" Plug 'chrisbra/Colorizer'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-obsession'
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
call plug#end()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) 

