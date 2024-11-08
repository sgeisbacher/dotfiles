-- general
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.backup = false
vim.opt.writebackup = true

-- navigation
vim.opt.backspace = "indent,eol,start"
-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- visuals
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
-- prevents left signcolumn to pop in and out all the time while typing (lsp errors)
vim.opt.signcolumn = "yes"
-- vim.opt.cursorline = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true -- disable ignorecase when search pattern contains upper case chars
vim.opt.incsearch = true

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true
