syntax on
set number
set clipboard=unnamedplus
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
let g:airline_powerline_fonts = 1
set ttimeoutlen=50
set completeopt-=preview
set ts=4 sw=4
command! -nargs=0 Sw w !sudo tee % > /dev/null
map <C-n> :NERDTreeToggle<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
call plug#end()
