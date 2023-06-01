return {
   -- 'tpope/vim-fugitive',
   {
      'sindrets/diffview.nvim',
      opts = {
         enhanced_diff_hl = true,
         view = {
            merge_tool = {
               layout = "diff4_mixed",
            },
         },
         win_config = {
            win_opts = {
               signcolumn = "no",
            },
         },
      },
   },
   {
      'lewis6991/gitsigns.nvim',
      opts = {},
   },
   {
      'TimUntersberger/neogit',
      cmd = { 'Neogit' },
      opts = {
         signs = {
            section = { '▸', '▾' },
            item = {
               '▸',
               '▾',
            },
            hunk = { '', '' },
         },
         disable_hint = true,
         integrations = {
            diffview = true,
         },
      }
   }
}
