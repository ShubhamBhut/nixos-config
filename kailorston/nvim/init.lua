vim.g.mapleader = " "
vim.wo.number = true
vim.opt.relativenumber = true

--colorscheme
vim.o.termguicolors = true

-- Autocmd to apply "ColorizerToggle" command
vim.cmd([[
  autocmd VimEnter * ColorizerToggle
]])


--LSP

-- keybindings

-- quick normal mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
-- shortcut for go and odin languages

vim.api.nvim_buf_set_keymap(0, 'i', 'qq', ':=', {noremap = true, silent = true})
-- go to beginning and end of lines 
-- vim.api.nvim_set_keymap('n', 'el', '$', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'bl', '0', {noremap = true})

-- change windows
vim.api.nvim_set_keymap('n', '<leader>w', '<C-W>w', {noremap = true})
-- change case
vim.api.nvim_set_keymap('n', 'cc', '~', {noremap = true})
--easy paragraph jumping
vim.api.nvim_set_keymap('n','<C-d>', '<C-d>zz', {noremap = true})
vim.api.nvim_set_keymap('n','<C-u>', '<C-u>zz', {noremap = true})
--paste without losing content from paste register
vim.api.nvim_set_keymap('n', '<leader>p', "\"_dP", {noremap = true})
vim.api.nvim_set_keymap('n','<C-d>', '<C-d>zz', {noremap = true})
--c++ keybind
vim.api.nvim_set_keymap("n", "rcp", ":!g++ % && ./a.out<CR>", { silent = true })

vim.cmd([[
let g:mapleader = "\<Space>"
nnoremap <Space> <Nop>
]])

--Debug
-- Open the UI elements automatically when a debugging session starts
vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>', { noremap = true })
-- Transparent background
vim.api.nvim_set_keymap('n', '<leader>bg', ':hi Normal guibg=NONE ctermbg=NONE<CR>', { noremap = true, silent = true })

--Lazy
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

require("options")
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

--background transparency toggle
require("notify").setup({
  background_colour = "#000000",
})

--colorscheme settings 
local dracula = require("dracula")
dracula.setup({
  transparent_bg = true, -- default false
  }
)
vim.g.nord_disable_background = true
require('rose-pine').setup({
	disable_background = false
})

vim.cmd[[colorscheme rose-pine]]
