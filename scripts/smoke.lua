vim.opt.runtimepath:append(vim.fn.fnamemodify(vim.fn.getcwd(), ":p"))
vim.o.termguicolors = true
vim.cmd.colorscheme("cursor-dark")

local fn = vim.api.nvim_get_hl(0, { name = "Function", link = false })
assert(fn and fn.fg ~= nil, "Function highlight missing")

print("ok")
