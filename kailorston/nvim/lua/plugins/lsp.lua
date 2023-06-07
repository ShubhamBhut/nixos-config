vim.diagnostic.config { signs = false }
return {
   {
      'neovim/nvim-lspconfig',
      keys = {
         { 'xx', vim.lsp.buf.code_action, mode = { 'n', 'x' } },
         { 'xf', vim.lsp.buf.format },
         { 'xr', vim.lsp.buf.rename },
         { 'gd', vim.lsp.buf.definition },
         { 'gt', vim.lsp.buf.type_definition },
         { 'gi', '<cmd>Telescope lsp_implementations<cr>' },
         { 'gr', '<cmd>Telescope lsp_references<cr>' },
         { 'g<space>', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>' },
      },
      event = "BufEnter",
      config = function()
         local cfg = require 'lspconfig'
         -- cfg.clangd.setup {}
         cfg.rust_analyzer.setup {}
         -- cfg.tsserver.setup {
         --    single_file_support = false,
         -- }
         cfg.pyright.setup {
            single_file_support = true,
         }
         cfg.tsserver.setup {}
         cfg.emmet_ls.setup {}
         cfg.lua_ls.setup {}
         cfg.ols.setup {}
         cfg.yamlls.setup {}
         cfg.solidity_ls.setup {}
         -- cfg.lua_ls.setup {}
         -- cfg.nil_ls.setup {}
         -- cfg.denols.setup {}
         -- cfg.svelte.setup {}
      end,
   },
   {
      'simrat39/rust-tools.nvim',
      event = "BufReadPre *.rs",
      enabled = ture;
      keys = {
         { 'gu', function() require('rust-tools').parent_module.parent_module() end }
      },
      config = function()
         local caps = require('cmp_nvim_lsp').default_capabilities()
         require('rust-tools').setup {
            tools = {
               inlay_hints = {
                  auto = false,
               },
            },
            server = {
               -- cmd = { 'nc', 'localhost', '6969' },
               root_dir = function(fname)
                  local util = require 'lspconfig.util'
                  return util.root_pattern 'Cargo.lock' (fname)
                      or util.root_pattern 'Cargo.toml' (fname)
                      or util.root_pattern 'rust-project.json' (fname)
                      or util.find_git_ancestor(fname)
               end,
               capabilities = caps,
               standalone = false,
            },
         }
      end,
   },
   {
      'Maan2003/lsp_lines.nvim',
      enabled = true;
      event = "LspAttach",
      keys = {
         {
            'xe',
            function()
               local old = vim.diagnostic.config().virtual_lines
               if old then
                  vim.diagnostic.config {
                     virtual_text = true,
                     underline = {
                        severity = { min = vim.diagnostic.severity.WARN }
                     },
                     virtual_lines = false,
                  }
               else
                  vim.diagnostic.config {
                     virtual_text = false,
                     underline = true,
                     virtual_lines = true,
                  }
               end
            end,
         },
      },
      config = function()
         require('lsp_lines').setup()
         vim.diagnostic.config {
            virtual_text = true,
            underline = {
               severity = { min = vim.diagnostic.severity.WARN }
            },
            virtual_lines = false,
         }
      end,
   },
}
