return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = function()
    local env = {}
    local env_file = vim.fn.expand('~/.env')
    if vim.fn.filereadable(env_file) == 1 then
      for line in io.lines(env_file) do
        local key, value = line:match("^([^=]+)=(.*)$")
        if key and value then
          env[key:gsub("%s+", "")] = value:gsub('^"', ''):gsub('"$', '')
        end
      end
    end

    return {
      provider = "claude",
      claude = {
        api_key = env.CLAUDE_API_KEY or os.getenv("CLAUDE_API_KEY"),
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
      },
      mappings = {
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      windows = {
        position = "right",
        width = 30,
      },
    }
  end,
  config = function(_, opts)
    require('avante').setup(opts)
  end
}
