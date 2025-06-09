options = {
    ui = {
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
            separator_style = "default",
            order = nil,
            modules = nil,
          },
    }
}

return vim.tbl_deep_extend("force", options, {})
