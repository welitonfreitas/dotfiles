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
    { 
        'echasnovski/mini.snippets', 
        version = false,
        config = function()
            local gen_loader = require('mini.snippets').gen_loader
            require('mini.snippets').setup({
                -- Define your snippets here
                snippets = {
                    -- Load custom file with global snippets first (adjust for Windows)
                    gen_loader.from_file('~/.config/nvim/snippets/global.json'),
                
                    -- Load snippets based on current language by reading files from
                    -- "snippets/" subdirectories from 'runtimepath' directories.
                    gen_loader.from_lang(),
                },
            })
        end
    },

    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
        config = function(_, opts)
            local pairs = require("mini.pairs")
            pairs.setup(opts)
            local open = pairs.open
            pairs.open = function(pair, neigh_pattern)
                if vim.fn.getcmdline() ~= "" then
                    return open(pair, neigh_pattern)
                end
                local o, c = pair:sub(1, 1), pair:sub(2, 2)
                local line = vim.api.nvim_get_current_line()
                local cursor = vim.api.nvim_win_get_cursor(0)
                local next = line:sub(cursor[2] + 1, cursor[2] + 1)
                local before = line:sub(1, cursor[2])
                if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
                    return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
                end
                if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
                    return o
                end
                if opts.skip_ts and #opts.skip_ts > 0 then
                    local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
                    for _, capture in ipairs(ok and captures or {}) do
                        if vim.tbl_contains(opts.skip_ts, capture.capture) then
                        return o
                        end
                    end
                end
                if opts.skip_unbalanced and next == c and c ~= o then
                    local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
                    local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
                    if count_close > count_open then
                        return o
                    end
                end
                return open(pair, neigh_pattern)
            end
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