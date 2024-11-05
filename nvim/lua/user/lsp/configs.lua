local lspconfig = require("lspconfig")
local servers = {
  "tsserver",
  "gopls",
  "lua_ls",
  "terraformls",
  "templ",
  "zls",
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end

-- register file-extensions
vim.filetype.add({ extension = { templ = "templ" } })
