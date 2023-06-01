vim.g.mapleader = " "
vim.wo.number = true
vim.opt.relativenumber = true

--colorscheme
vim.cmd[[colorscheme dracula]]
vim.o.termguicolors = true

-- Autocmd to apply "ColorizerToggle" command
vim.cmd([[
  autocmd VimEnter * ColorizerToggle
]])

-- keybindings
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'i', 'qq', ':=', {noremap = true, silent = true})

vim.cmd([[
let g:mapleader = "\<Space>"
nnoremap <Space> <Nop>
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--require("options")
require("lazy").setup("plugins", {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

if vim.fn.getcwd():match("cp") then
	vim.cmd([[autocmd BufEnter *.cpp lua _CpAu()]])
	function _CpAu()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		if vim.fn.search("// headers {{{") == 0 then
			vim.cmd([[0r~/cp/web/template.cpp]])
		end
		vim.cmd([[setlocal foldmethod=marker foldlevel=0]])
		local lastline = vim.fn.line("$")
		if line > lastline then
			line = lastline
		end
		vim.api.nvim_win_set_cursor(0, { line, col })
	end
end

