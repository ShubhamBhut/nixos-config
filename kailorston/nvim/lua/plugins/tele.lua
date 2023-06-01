return {
   {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      dependencies = {
         {
            'nvim-telescope/telescope-fzy-native.nvim',
         },
         {
            'nvim-telescope/telescope-frecency.nvim',
            dependencies = { 'tami5/sqlite.lua' },
         },
      },
      keys = {
         { '<Leader>b', '<cmd>Telescope buffers<cr>' },
         { '<Leader>F', '<cmd>Telescope frecency<cr>' },
         { '<Leader>sc', '<cmd>Telescope live_grep<cr>' },
         { '<Leader>f', '<cmd>Telescope find_files<cr>'}
      },
      config = function()
         require('telescope').load_extension 'frecency'
         require('telescope').load_extension 'fzy_native'
         require('telescope').setup {
            defaults = {
               mappings = {
                  i = {
                     ['<f9>'] = require('telescope.actions').close,
                  },
               },
               layout_config = {
                  horizontal = {
                     width = 999,
                     height = 999,
                     preview_width = 0.60,
                  },
               },
            },
            pickers = {
               find_files = {
                  find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
               },
            },
            extensions = {
               fzy_native = {
                  override_generic_sorter = true,
                  override_file_sorter = true,
               },
               frecency = {
                  ignore_patterns = {
                     '*.git/*',
                     '*/tmp/*',
                     '/usr/*',
                     '*/.rustup/*',
                     '/share/*',
                     '/usr/*',
                     '*/.cargo/registry/*',
                  },
               },
            },
         }
      end
   },
   {
      "stevearc/dressing.nvim",
      lazy = true,
      init = function()
         ---@diagnostic disable-next-line: duplicate-set-field
         vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
         end
         ---@diagnostic disable-next-line: duplicate-set-field
         vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
         end
      end,
   },
}
