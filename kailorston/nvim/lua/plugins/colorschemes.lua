vim.cmd [[autocmd FileType * set formatoptions-=o]]
return {
    {
        "fffnite/gleam-theme-nvim",
    },
    {
        "ellisonleao/gruvbox.nvim", priority = 1000,
        opts = {},
    },
    {
        "mcchrish/zenbones.nvim",
        requires = 'rktjmp/lush.nvim',
    },
    {
        'rktjmp/lush.nvim',
    },
    {
        "EdenEast/nightfox.nvim",
        opts = {},
    },
    {
        "rebelot/kanagawa.nvim",
        opts = {},
    },
    {
        'shaunsingh/nord.nvim',
    },
    {
         'rose-pine/neovim', name = 'rose-pine',
        opts = {},
    }
}
