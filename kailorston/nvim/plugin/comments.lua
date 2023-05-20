require('Comment').setup()

-- Set up the comment string for Python files
require('Comment').setup({
  comment_empty = false,
  create_mappings = true,
  marker_padding = true,
  comment_padding = true,
  ignore = '^$',
  padding_mark = '|',
  mappings = {
    python = {
      comment = "# %s",
      toggle = "# %s",
      line = "#",
    },
  },
})
