" don't auto-comment new lines
autocmd BufEnter * set formatoptions-=cro

" highlight on yanking
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

" show cursor line only in active window
"augroup CursorLine
"  autocmd!
"  autocmd InsertLeave,WinEnter * set cursorline
"  autocmd InsertEnter,WinLeave * set nocursorline
"augroup END

" enable spell checking for certain file types
autocmd BufRead,BufNewFile *.txt,*.md,*.tex,*.sql setlocal spell spelllang=en_gb

" set caret to bar/beam on exit
" autocmd VimLeave * set guicursor=a:ver25
