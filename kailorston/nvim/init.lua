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
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- keybindings
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'i', 'qq', ':=', {noremap = true, silent = true})

--c++ keybind
vim.api.nvim_set_keymap("n", "rcp", ":!g++ % && ./a.out<CR>", { silent = true })

vim.cmd([[
let g:mapleader = "\<Space>"
nnoremap <Space> <Nop>
]])

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

--colorscheme settings 
local dracula = require("dracula")
dracula.setup({
  transparent_bg = true, -- default false
  }
)
vim.g.nord_disable_background = true
require('rose-pine').setup({
	disable_background = true
})

vim.cmd[[colorscheme rose-pine]]
