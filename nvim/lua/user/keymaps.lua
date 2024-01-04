local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--
--
--
-- GENERAL
keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--
--
--
--
-- NORMAL MODE --
keymap("n", "<leader>ttc", ":cclose<CR>", opts) -- close tooltip pane
keymap("n", "<m-o>", "<cmd>lua require('fzf-lua').files()<CR>", opts) -- open fuzzy file search
-- keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').grep({ search = '', cmd = 'git grep --line-number --column --color=always' })<CR>", opts)
-- keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').grep({ search = '', rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=120 --hidden -M 120 -g \"!.git\"'})<CR>", opts)
-- open fuzzy grep search -- grep also in hidden
--    -M 120 only indexes the first 120 chars of each line, so you get all those minified thousands of chars oneliners out of your index
keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').grep({ search = '' })<CR>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('fzf-lua').resume()<CR>", opts)

-- git
keymap("n", "<leader>b", ":GitBlameToggle<CR>", opts)
keymap("n", "<leader>bb", ":GitBlameOpenFileURL<CR>", opts)

-- search
keymap("n", "n", "nzz", opts) -- center next search-result
keymap("n", "N", "Nzz", opts) -- center prev search-result
keymap("n", "<leader><leader>", ":nohlsearch<CR>", opts) -- reset search-term highlighting

-- yank to register b
keymap("n", "yb", '"byy', opts)
keymap("n", "bp", '"bp', opts)
keymap("n", "bP", '"bP', opts)

-- yank to register c
keymap("n", "yc", '"cyy', opts)
keymap("n", "cp", '"cp', opts)
keymap("n", "cP", '"cP', opts)

-- split planes
keymap("n", "<leader>vs", ":wincmd v<CR>", opts) -- split windows vertical
keymap("n", "<leader>ss", ":wincmd s<CR>", opts) -- split windows horizontal
keymap("n", ">", "<C-w>>", opts) -- grow split pane
keymap("n", "<", "<C-w><", opts) -- shrink split pane

-- navigation
-- in buffer
keymap("n", "[", "{", opts) -- jump one paragraph up
keymap("n", "]", "}", opts) -- jump one paragraph down

-- in window
keymap("n", "<m-h>", ":bp<CR>", opts) -- jump to next buffer
keymap("n", "<m-l>", ":bn<CR>", opts) -- jump to prev buffer

keymap("n", "<C-h>", "<C-w>h", opts) -- jump to left pane
keymap("n", "<C-l>", "<C-w>l", opts) -- jump to right pane
keymap("n", "<C-k>", "<C-w>k", opts) -- jump to upper pane
keymap("n", "<C-j>", "<C-w>j", opts) -- jump to lower pane

keymap("n", "<S-Up>", ":resize -2<CR>", opts) -- shrink pane vertical
keymap("n", "<S-Down>", ":resize +2<CR>", opts) -- grow pane vertical
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts) -- shrink pane horizontal
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts) -- grow pane horizontal

--
--
--
--
--
-- VISUAL MODE --
-- yanking
keymap("v", "<leader>y", '"+y', opts) -- yank to os clipboard
keymap("v", "yb", '"byy', opts) -- yank to register b
keymap("v", "yc", '"cyy', opts) -- yank to register c
keymap("v", "p", '"_dP', opts) -- yank to register c

-- window navigation
keymap("v", "<Up>", "<nop>", opts)
keymap("v", "<Down>", "<nop>", opts)

-- search
keymap("v", "//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", opts) -- search for selected text
