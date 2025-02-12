vim.wo.relativenumber = true
vim.api.nvim_set_option("clipboard","unnamed")
vim.opt.ignorecase = true
if (jit.os == "Windows") then 
	vim.cmd [[colorscheme vim]]
end
