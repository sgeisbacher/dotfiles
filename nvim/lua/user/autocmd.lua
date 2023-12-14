-- close quickfix-list after opening an entry
-- :autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  command = "nmap <buffer> <cr> <cr>:ccl<cr>",
})
