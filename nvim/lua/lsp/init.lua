local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
require("lsp.cmp")
require("lsp.vsnip")
--require("lsp.lsp-signature")
