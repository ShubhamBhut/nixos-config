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
      'tamton-aquib/mpv.nvim',
      opts = {},
   },
   {
      'numToStr/Comment.nvim',
      opts = {},
   },
   {
      'mattn/emmet-vim'
   },
   {
      'ThePrimeagen/vim-be-good'
   },
   {
      'norcalli/nvim-colorizer.lua',
      opts = {},
   },
   {
      'theprimeagen/harpoon',
      opts = {},
      config = function(_, opts)
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
        end,
   },
   {
      'mbbill/undotree',
      config = function(_, opts)
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
      end,
   },

   -- lazy.nvim
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
         -- add any options here
      },
      dependencies = {
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
      }
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
      keys = {
         { "<leader>t", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
      },
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
      },
      opts = {
         filesystem = {
            filtered_items = {
               visible = true,
               show_hidden_count = true,
               hide_dotfiles = false,
               hide_gitignored = true,
               hide_by_name = {
                  -- '.git',
                  -- '.DS_Store',
                  -- 'thumbs.db',
               },
               never_show = {},
            },
         }
      }
   }
}
