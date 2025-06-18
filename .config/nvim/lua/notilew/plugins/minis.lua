return {
    {
        'echasnovski/mini.animate', 
        version = false,
        config = function()
            require('mini.animate').setup()
        end
    },
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
        keys = function(_, keys)
            local mappings = {
                { "gsa", desc = "Add Surrounding", mode = { "n", "v" } },
                { "gsd", desc = "Delete Surrounding" },
                { "gsf", desc = "Find Right Surrounding" },
                { "gsF", desc = "Find Left Surrounding" },
                { "gsh", desc = "Highlight Surrounding" },
                { "gsr", desc = "Replace Surrounding" },
                { "gsn", desc = "Update `MiniSurround.config.n_lines`" },
            }
            mappings = vim.tbl_filter(function(m)
            return m[1] and #m[1] > 0
            end, mappings)
            return vim.list_extend(mappings, keys)
        end,
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