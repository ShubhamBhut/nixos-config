local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier.with({
        filetypes = { "html", "css" }})
}

null_ls.setup({ sources = sources })
