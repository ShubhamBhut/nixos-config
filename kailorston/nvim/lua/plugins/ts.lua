return {
   {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
         require('nvim-treesitter.configs').setup {
            highlight = {
               enable = true,
               additional_vim_regex_highlighting = false,
            },
            indent = {
               enable = true,
            },
         }
      end,
   },
   {
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
   },
   {
      'romgrk/nvim-treesitter-context',
      enabled = false,
      after = 'nvim-treesitter',
      opts = {
         patterns = {
            default = {
               'class',
               'function',
               'method',
               'for',
               'while',
               'if',
               'switch',
               'case',
            },
            rust = {
               'impl_item',
               'let_declaration',
            },
         },
      }
   },
   {
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- really ununsable right now
      enabled = false,
      config = function()
         require('nvim-treesitter.configs').setup {
            textobjects = {
               move = {
                  enable = true,
               },
               select = {
                  enable = true,

                  -- Automatically jump forward to textobj, similar to targets.vim
                  lookahead = true,

                  keymaps = {
                     -- You can use the capture groups defined in textobjects.scm
                     ['af'] = '@function.outer',
                     ['if'] = '@function.inner',
                     ['at'] = '@statement.outer',
                     ['it'] = '@statement.inner',
                     ['ab'] = '@block.outer',
                     ['ib'] = '@block.inner',
                  },
               },
            },
         }
      end,
   }
}
