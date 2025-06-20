return {
    {
        'echasnovski/mini.animate', 
        version = false,
        config = function()
            require('mini.animate').setup()
        end
    },
    { 'echasnovski/mini.nvim', version = false },
    -- { 'echasnovski/mini.statusline', version = false },
    { 
        'echasnovski/mini.files', 
        version = false,
        config = function()
            require('mini.files').setup()
        end,
        keys = {
            { "<leader>mf", "<cmd>lua require('mini.files').open()<cr>", desc = "Open Mini Files" },
            { "<leader>mF", "<cmd>lua require('mini.files').open(vim.fn.expand('%:p'))<cr>", desc = "Open Mini Files with current file" },
        }
    },
    { 
        'echasnovski/mini.indentscope', 
        version = false,
    },
    { 
        'echasnovski/mini.sessions', 
        version = false,
        config = function()
            require('mini.sessions').setup({
                -- Custom session file path
                directory = vim.fn.stdpath('data') .. '/sessions',
                -- Automatically save sessions on Vim exit
                autoload = true,
                -- Automatically load sessions on Vim start
                autoload_last = true,
                autowrite = true,
            })
        end
    },
    { 
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = ";;", -- Add surrounding in Normal and Visual modes
                delete = ";d", -- Delete surrounding
                find = ";f", -- Find surrounding (to the right)
                find_left = ";F", -- Find surrounding (to the left)
                highlight = ";h", -- Highlight surrounding
                replace = ";r", -- Replace surrounding
                update_n_lines = ";n", -- Update `n_lines`
            },
        },
    },

    -- {
    --     "echasnovski/mini.indentscope",
    --     version = "*",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         require("mini.indentscope").setup({
    --             draw = {
    --                 delay = 0,
    --                 animation = function()
    --                     return 0
    --                 end,
    --             },
    --             symbol = "│",
    --             try_as_border = true,
    --             options = {
    --                 -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    --                 border = "both",
    --             },
    --         })
    --     end,
    -- }
}