call plug#begin("~/.vim/plugged")

    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'herringtondarkholme/yats.vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'liuchengxu/vim-which-key'
    Plug 'fatih/vim-go'
    Plug 'unblevable/quick-scope' " higlight for f t
    Plug 'tpope/vim-commentary' "gcc
"    Plug 'vim-airline/vim-airline'
"    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'

call plug#end()

