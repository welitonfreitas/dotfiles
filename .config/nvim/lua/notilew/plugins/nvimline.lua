return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
            options = {
                theme = "tokyonight",
                section_separators = { left = '', right = ''},
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {'branch', {
                    'diff',
                    colored = true, -- Displays a colored diff status if set to true
                    diff_color = {
                        -- Same color values as the general color option can be used here.
                        added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
                        modified = 'LuaLineDiffChange', -- Changes the diff's modified color
                        removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
                    },
                    symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
                    source = nil, -- A function that works as a data source for diff.
                    -- It must return a table as such:
                    --   { added = add_count, modified = modified_count, removed = removed_count }
                    -- or nil on failure. count <= 0 won't be displayed.
                }, 'diagnostics'},
                lualine_c = { {
                    'filename',
                    file_status = true,      -- Displays file status (readonly status, modified status)
                    newfile_status = false,  -- Display new file status (new file means no write after created)
                    path = 0,                -- 0: Just the filename
                                            -- 1: Relative path
                                            -- 2: Absolute path
                                            -- 3: Absolute path, with tilde as the home directory
                                            -- 4: Filename and parent dir, with tilde as the home directory
                    shorting_target = 40,   -- Shortens path to leave 40 spaces in the window
                                            -- for other components. (terrible name, any suggestions?)
                    symbols = {
                        modified = '[+]',      -- Text to show when the file is modified.
                        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]',     -- Text to show for newly created file before first write
                    }
                } },
                lualine_x = {
                    {
                        'lsp_status',
                        icon = '', -- f013
                        symbols = {
                            -- Standard unicode symbols to cycle through for LSP progress:
                            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            -- Standard unicode symbol for when LSP is done:
                            done = '✓',
                            -- Delimiter inserted between LSP names:
                            separator = ' ',
                        },
                        -- List of LSP names to ignore (e.g., `null-ls`):
                        ignore_lsp = {},
                    },
                    'encoding', 
                    {
                        'fileformat',
                        symbols = {
                            unix = '', -- e712
                            dos = '',  -- e70f
                            mac = '',  -- e711
                        }
                    },
                    {
                        'filetype',
                        colored = true,   -- Displays filetype icon in color if set to true
                        icon_only = false, -- Display only an icon for filetype
                        icon = { align = 'right' }, -- Display filetype icon on the right hand side
                        -- icon =    {'X', align='right'}
                        -- Icon string ^ in table is ignored in filetype component
                    },
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = { "progress", "searchcount"  },
                lualine_z = { "location" },
            },
            extensions = { "fugitive", "quickfix", "fzf", "lazy", "mason", "nvim-dap-ui", "oil", "trouble" },
            })
        end,
    },
}