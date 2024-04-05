vim.cmd [[autocmd FileType * set formatoptions-=o]]
return {
    {
        'nvim-neotest/nvim-nio',
    },

    {
        'mfussenegger/nvim-dap',
        config = function()
            vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", {}, "Continue")
            vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", {}, "Step over")
            vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", {}, "Step into")
            vim.keymap.set("n", "<leader>dx", ":lua require'dap'.step_out()<CR>", {}, "Step out")
            vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", {}, "Toggle Breakpoint")
            vim.keymap.set("n", "<leader>dB",
                ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {},
                "Set breakpoint with condition")
            vim.keymap.set("n", "<leader>dl",
                ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {},
                "Set breakpoint with log message")
            vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {}, "Open the REPL")
        end
    },

    {
        'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup({
            })
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },

    {
        'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup("/nix/store/1wdq5l8mdyz1a767kgxc83rsna7ic2mw-user-environment/bin/python")
            vim.keymap.set('n', '<leader>dn', [[<cmd>lua require('dap-python').test_method()<CR>]],
                { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>df', [[<cmd>lua require('dap-python').test_class()<CR>]],
                { noremap = true, silent = true })
            vim.keymap.set('x', '<leader>ds', [[<cmd>lua require('dap-python').debug_selection()<CR>]],
                { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dp", ":lua require'dap-python'.test_method()<CR>", {}, "Test method for python")
        end,
    },

    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        },
    },

    {
        'rouge8/neotest-rust',
        opts = {},
        config = function(_, opts)
        end
    },

    {
        'nvim-neotest/neotest-python'
    },
}
