call plug#begin("~/.vim/plugged")

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'neovim/nvim-lspconfig'
    Plug 'sbdchd/neoformat'
    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'herringtondarkholme/yats.vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'liuchengxu/vim-which-key'
    Plug 'fatih/vim-go'
    Plug 'unblevable/quick-scope' " higlight for f t
    Plug 'tpope/vim-commentary' "gcc
    Plug 'airblade/vim-gitgutter' "gcc
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'jparise/vim-graphql'
    Plug 'tveskag/nvim-blame-line'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'hashivim/vim-terraform'

call plug#end()

