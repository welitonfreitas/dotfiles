-- options = {
--     ui = {
--         tabufline = {
--             enabled = true,
--             lazyload = true,
--             order = { "treeOffset", "buffers", "tabs", "btns" },
--             modules = nil,
--             bufwidth = 21,
--         },
--         statusline = {
--             enabled = true,
--             theme = "default", -- default/vscode/vscode_colored/minimal
--             -- default/round/block/arrow separators work only for default statusline theme
--             -- round and block will work for minimal theme only
--             separator_style = "block",
--             order = nil,
--             modules = nil,
--         },
--     }
-- }

-- return vim.tbl_deep_extend("force", options, {})

local M = {}
M.base46 = {
    theme = "tokyodark",
    hl_add = {},
    hl_override = {},
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "tokyodark", "ayu_light" },
}

M.ui = {
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
        bufwidth = 21,
    },
    statusline = {
        enabled = true,
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "block",
        modules = nil,
    },
    telescope = { style = "bordered" }, -- borderless / bordered
}

return M