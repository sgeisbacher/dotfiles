local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--
--
--
-- GENERAL
keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--
--
--
--
-- NORMAL MODE --
keymap("n", "<leader>cc", ":copen<CR>", opts) -- open quickfix pane
keymap("n", "<leader>ttc", ":cclose<CR>", opts) -- close tooltip pane
keymap("n", "<m-o>", "<cmd>lua require('fzf-lua').files()<CR>", opts) -- open fuzzy file search
-- keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').grep({ search = '', cmd = 'git grep --line-number --column --color=always' })<CR>", opts)
-- keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').grep({ search = '', rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=120 --hidden -M 120 -g \"!.git\"'})<CR>", opts)
-- open fuzzy grep search -- grep also in hidden
--    -M 120 only indexes the first 120 chars of each line, so you get all those minified thousands of chars oneliners out of your index
keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').grep({ search = '' })<CR>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('fzf-lua').resume()<CR>", opts)
keymap("n", "<leader>xfp", "<cmd>lua require('fzf-lua').command_history()<CR>", opts)
keymap("v", "<leader>r", 'hy:%s/<C-r>"//gc<left><left><left>', opts) --
--keymap("n", "<leader>ffp", "<cmd>lua require('fzf-lua').resume()<CR>", opts)
-- DEBUGGER DAP --
keymap("n", "<m-b>", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<m-s>", "<cmd>lua require('dap').step_over()<cr>", opts)
keymap("n", "<m-c>", "<cmd>lua require('dap').continue()<cr>", opts)
keymap("n", "<m-d>", "<cmd>lua require('dapui').toggle()<cr>", opts)

-- git
keymap("n", "<leader>b", ":GitBlameToggle<CR>", opts)
keymap("n", "<leader>bb", ":GitBlameOpenFileURL<CR>", opts)
keymap("n", "<leader>hh", "<cmd>lua require('gitsigns').preview_hunk()<CR>", opts)
keymap("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", opts)
keymap("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", opts)
keymap("n", "<leader>hn", "<cmd>lua require('gitsigns').nav_hunk('next')<CR>", opts)

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
keymap("n", "<m-j>", "20jzz", opts) -- jump down 20 lines and center the line
keymap("n", "<m-k>", "20kzz", opts) -- jump down 20 lines and center the line
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
keymap("v", "g//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", opts) -- search for selected text
