return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("avante").setup({
      provider = "claude",
      auto_suggestions_provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0.2,
        max_tokens = 4096,
        api_key_name = "ANTHROPIC_API_KEY", -- Use environment variable directly
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        window_type = "float",
      },
      windows = {
        position = "right",
        width = 80,
        height = 30,
        sidebar_header = {
          enabled = false,
          align = "center",
          rounded = true,
        },
        input = {
          prefix = "> ",
          height = 8,
        },
        edit = {
          border = "rounded",
          start_insert = false,  -- Don't start in insert mode
        },
        ask = {
          floating = true, -- Open the 'AvanteAsk' prompt in a floating window
          border = "rounded",
          start_insert = false, -- Start insert mode when opening the ask window
          focus_on_apply = "ours", -- which diff to focus after applying
        },
      },
      hints = {
        enabled = true,
      },
    })

    -- Custom keymapping to toggle the window
    vim.keymap.set("n", "<leader>at", "<cmd>AvanteToggle<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle Avante window",
    })
  end,
}
