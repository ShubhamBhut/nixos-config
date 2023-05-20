vim.g.mapleader = " "
vim.wo.number = true
vim.opt.relativenumber = true

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.keymap.set({'n', 't'}, '<leader>e' ,'<C-w><C-w>', { noremap = true })
map('n', '<leader>t', ':NvimTreeToggle<CR>')
--map('n', '<leader>r', ':belowright split term://bash')
map('n', '<C-r>', ':resize10')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

-- keybinding for := as its slow to type
vim.api.nvim_buf_set_keymap(0, 'i', 'qq', ':=', {noremap = true, silent = true})


require('packer-plugins')

vim.api.nvim_set_keymap('n', '<Leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', {noremap = true, silent = true}) 
require("null-ls")


--Neovide configs
if vim.g.neovide then
	-- Helper function for transparency formatting
	vim.g.neovide_transparency_point= 0.8
	local alpha = function()
  	return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.7
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = "#0f1117" .. alpha()
	vim.g.neovide_fullscreen = true

	vim.opt.guifont = { "Source Code Pro", ":h15" }
end
