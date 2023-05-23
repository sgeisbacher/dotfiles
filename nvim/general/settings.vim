syntax enable

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set cursorline
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=2


"let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox
set background=dark

" popup-pane
highlight Pmenu ctermbg=black
" popup-pane END


" auto-format
"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.mjs Neoformat

