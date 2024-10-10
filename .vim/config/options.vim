" Set Options in Vim

" System Settings
set nobackup                  " Don't create a backup file
set clipboard=unnamedplus      " Use system clipboard
set fileencoding=utf-8         " File encoding

set ignorecase                 " Case insensitive searching
set nosmartcase                " Disable smart case (case-sensitive search only when pattern contains uppercase letters)
set smartindent                " Enable smart indentation
set noswapfile                 " Disable swap file creation
set timeoutlen=1000            " Time to wait for a key sequence to complete
set undofile                   " Enable persistent undo
set updatetime=100             " Faster completion, reduced time
set nowritebackup              " Disable write backup (prevent other programs from editing while you edit)

" Indentation
set expandtab                  " Convert tabs to spaces
set shiftwidth=4               " Number of spaces to use for each level of indentation
set tabstop=4                  " Number of spaces that a tab counts for

" Window Splitting
set splitbelow                 " Horizontal splits will go below
set splitright                 " Vertical splits will go to the right

" Appearance Settings
set belloff=all                " Disable the annoying bell
set cmdheight=1                " Space for the command line (no cmdheight=0 in Vim)
set conceallevel=0             " Show all text normally (markdown setting)
set nohlsearch                 " Don't highlight search results
set pumheight=10               " Popup menu height
set noshowmode                 " Disable showing mode (INSERT, NORMAL, etc.)
set showtabline=1              " Always show tabline
set termguicolors              " Enable true color support
" set cursorline                 " Highlight the current line
set ruler                      " Show the ruler in the status line
set showcmd                    " Show command in the status line
set number                     " Show absolute line numbers
set relativenumber             " Show relative line numbers
set signcolumn=yes             " Always show the sign column
set scrolloff=0                " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=8            " Minimal number of columns to keep left and right of the cursor
set title                      " Show title of file in the terminal tab
set titlelen=0                 " No limit on title length
" GUI Font (For GUI Versions Only)
set guifont=JetBrainsMono\ Nerd\ Font:h12

" Short messages
set shortmess+=I               " Disable intro/start message

" Netrw Settings (for Lex)
let g:netrw_banner = 0         " Disable netrw banner
let g:netrw_mouse = 2          " Enable mouse usage in netrw

