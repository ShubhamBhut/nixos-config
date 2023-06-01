vim.cmd [[autocmd FileType * set formatoptions-=o]]
return {
   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {},
   },
   -- {
   --     "echasnovski/mini.pairs",
   --     event = "VeryLazy",
   --     config = function(_, opts)
   --       require("mini.pairs").setup(opts)
   --     end,
   -- }
  {
      'sbdchd/neoformat',
      cmd = { 'Neoformat' },
   },
   {
      'Mofiqul/dracula.nvim',
      opts = {},
   },
   {
      'nmac427/guess-indent.nvim',
      opts = {},
   },
   {
      'numToStr/Comment.nvim',
      opts = {},
   },
   {
      'norcalli/nvim-colorizer.lua',
      opts = {},
   },

   {
      "chrisgrieser/nvim-various-textobjs",
      opts = { useDefaultKeymaps = true },
      enabled = false, -- TODO enable
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      version = "v2.x",
      cmd = 'Neotree',
      dependencies = {
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
      }
   }
}
