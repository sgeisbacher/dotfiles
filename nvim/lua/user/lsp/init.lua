local ok, _ = pcall(require, "lspconfig")
if not ok then
  print("not loading lsp-configuration")
  return
end

require("user.lsp.configs")
require("user.lsp.handlers").setup()
