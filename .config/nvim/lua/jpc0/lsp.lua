local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
end

-- require('lspconfig').jedi_language_server.setup{
--	on_attach = attach,
--	capabilities = capabilities
--}
require('lspconfig').pyright.setup {
	on_attach = attach,
	capabilities = capabilities
}
require('lspconfig').tsserver.setup {
	on_attach = attach,
	capabilities = capabilities
}
require('lspconfig').clangd.setup{
	on_attach = attach,
	capabilities = capabilities
}
require('lspconfig').cmake.setup{
	on_attach = attach,
	capabilities = capabilities
}
require("lspconfig").gopls.setup{
	on_attach = attach,
	capabilities = capabilities
}
require("lspconfig").sumneko_lua.setup{
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = attach,
	capabilities = capabilities
}
