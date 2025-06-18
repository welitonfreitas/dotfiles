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
            -- Populate the keys based on the user's options
            local opts = LazyVim.opts("mini.surround")
            local mappings = {
            { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
            { opts.mappings.delete, desc = "Delete Surrounding" },
            { opts.mappings.find, desc = "Find Right Surrounding" },
            { opts.mappings.find_left, desc = "Find Left Surrounding" },
            { opts.mappings.highlight, desc = "Highlight Surrounding" },
            { opts.mappings.replace, desc = "Replace Surrounding" },
            { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
            }
            mappings = vim.tbl_filter(function(m)
            return m[1] and #m[1] > 0
            end, mappings)
            return vim.list_extend(mappings, keys)
        end,
        opts = {
            mappings = {
            add = "gsa", -- Add surrounding in Normal and Visual modes
            delete = "gsd", -- Delete surrounding
            find = "gsf", -- Find surrounding (to the right)
            find_left = "gsF", -- Find surrounding (to the left)
            highlight = "gsh", -- Highlight surrounding
            replace = "gsr", -- Replace surrounding
            update_n_lines = "gsn", -- Update `n_lines`
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