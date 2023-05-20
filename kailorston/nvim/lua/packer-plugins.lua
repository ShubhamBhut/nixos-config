return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'gruvbox-community/gruvbox'
	use 'Mofiqul/dracula.nvim'

	use {
		'nvim-tree/nvim-tree.lua',
  		requires = {
    		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	},
	}

	--telescope
	tag = 'nightly' -- optional, updated every week. (see issue #1193)

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--treesitter
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	--lsp 
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			-- Snippet Collection (Optional)
			{'rafamadriz/friendly-snippets'},
		}
	}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}

	-- autopairs completion
	use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

	-- formatter
	require('packer').use { 'mhartington/formatter.nvim' }

	--rust tools
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'
	-- Debugging
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'

	--indent line 
	use "lukas-reineke/indent-blankline.nvim"

	--barber for tab
	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

	-- CSS colorisor
	use 'norcalli/nvim-colorizer.lua'

	--null-ls for external modules (mainly formatters)
	use 'jose-elias-alvarez/null-ls.nvim'

	--Odin highlighting
	use 'Tetralux/odin.vim'

	-- quick commenting and uncommenting
	use {
		'numToStr/Comment.nvim',
		config = function()
        	require('Comment').setup()
	end
	}
end)
