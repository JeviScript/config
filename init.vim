call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()

set number
set background=dark
set termguicolors
set showtabline=2
colorscheme onedark

let mapleader = "\<Space>"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:rooter_patterns = ['Rakefile', '.git/']
let g:fzf_layout = { 'down': '~20%' }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#shorten_path = 0

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" key bindings
""" move block
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>
nnoremap <C-g> :Rg<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>
