" Set global and local leader keys
let mapleader = " "
let maplocalleader = " "

" NORMAL and VISUAL mode mappings

" Copy to system clipboard
noremap <silent> <leader>y "+y
vnoremap <silent> <leader>y "+y

" Paste from system clipboard
noremap <silent> <leader>p "+p
vnoremap <silent> <leader>p "+p

" Increment / Decrement numbers
noremap <silent> + <C-a>
noremap <silent> - <C-x>

" Delete a word backwards
noremap <silent> dw vb_d

" Select all
noremap <silent> <C-a> gg<S-v>G

" Open Lex
noremap <silent> lx :Lex<CR>

" Tabs
noremap <silent> te :tabnew<CR>
noremap <silent> <Tab> :tabnext<CR>
noremap <silent> <S-Tab> :tabprev<CR>

" Splits
noremap <silent> ss :split<CR>
noremap <silent> sv :vsplit<CR>

" Move between windows
noremap <silent> sh <C-w>h
noremap <silent> sk <C-w>k
noremap <silent> sj <C-w>j
noremap <silent> sl <C-w>l

" Resize windows
noremap <silent> <C-w><Left> <C-w><
noremap <silent> <C-w><Right> <C-w>>
noremap <silent> <C-w><Up> <C-w>+
noremap <silent> <C-w><Down> <C-w>-

" INSERT mode

" Go to normal mode
inoremap <silent> jk <ESC>

" Navigate in insert mode
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>

" VISUAL mode

" Paste over selected text without yanking
vnoremap <silent> p "_dp
vnoremap <silent> P "_dP

" Move lines up and down
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv

" Stay in indent mode
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Plugin-specific mappings

" Lazy plugin manager
noremap <silent> <leader>L :Lazy<CR>

" Neotree file explorer
noremap <silent> <leader>e :Neotree toggle left<CR>
noremap <silent> <leader>E :Neotree toggle float<CR>

" Telescope commands
noremap <silent> <leader>ff :Telescope find_files<CR>
noremap <silent> <leader>fg :Telescope git_files<CR>
noremap <silent> <leader>fl :Telescope live_grep<CR>
noremap <silent> <leader>fb :Telescope buffers<CR>
noremap <silent> <leader>fo :Telescope oldfiles<CR>
noremap <silent> <leader>ft :TodoTelescope<CR>

" Zen mode
noremap <silent> <leader>Z :ZenMode<CR>

" Markdown preview
noremap <silent> <leader>Mp :MarkdownPreview<CR>
noremap <silent> <leader>Mps :MarkdownPreviewStop<CR>
