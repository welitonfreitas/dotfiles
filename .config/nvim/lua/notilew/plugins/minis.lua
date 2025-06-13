return {
    -- { 'echasnovski/mini.statusline', version = false },
    { 
        'echasnovski/mini.files', 
        version = false,
        config = function()
            require('mini.files').setup()
        end 
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