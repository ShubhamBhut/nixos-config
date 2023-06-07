local opts = {
   completeopt = 'menuone,noselect',
   virtualedit = 'onemore',
   mouse = 'a',
   guifont = 'Fragment Mono:h12',
   undofile = true,
   expandtab = true,
   softtabstop = 4,
   tabstop = 4,
   shiftwidth = 4,
   hidden = true,
   clipboard = 'unnamedplus',
   incsearch = true,
   scrolloff = 1,
   ignorecase = true,
   smartcase = true,
   showmode = false,
   signcolumn = 'auto:1-2',
   conceallevel = 2,
   concealcursor = 'n',
   culopt="number",
   cul = true,
   showtabline = 0,
   title = true,
   titlestring = 'nvim - %{getcwd()}',
   cmdheight = 0,
}

-- vim.cmd[[let g:zenwritten_transparent_background = 1]]
for key, value in pairs(opts) do
   vim.o[key] = value
end

local wo = vim.wo
wo.wrap = false
wo.number = true
wo.foldmethod = 'expr'
wo.foldlevel = 99
vim.cmd[[
autocmd FileType * setlocal foldexpr=nvim_treesitter#foldexpr()
]]
