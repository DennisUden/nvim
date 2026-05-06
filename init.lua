vim.g.mapleader = ' '

vim.opt.relativenumber = true

vim.lsp.config['ols'] =
{
	cmd = { 'ols' },
	filetypes = { 'odin' },
	root_markers = { 'ols.json' },

}
vim.lsp.enable( 'ols' )

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
