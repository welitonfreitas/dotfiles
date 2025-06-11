

local get_header = require("notilew.core.utils.startpage-headers")
local datetime = tonumber(os.date(" %H "))
local header = get_header(0, true)


local greeting = function()
    -- Determine the appropriate greeting based on the hour
    local mesg
    local username = os.getenv("USERNAME") or os.getenv("USER") or "Estranho"
    if datetime >= 0 and datetime < 6 then
        mesg = "Dreaming..󰒲 󰒲 "
    elseif datetime >= 6 and datetime < 12 then
        mesg = "🌅 Hi " .. username .. ", Good Morning ☀️"
    elseif datetime >= 12 and datetime < 18 then
        mesg = "🌞 Hi " .. username .. ", Good Afternoon ☕️"
    elseif datetime >= 18 and datetime < 21 then
        mesg = "🌆 Hi " .. username .. ", Good Evening 🌙"
    else
        mesg = "Hi " .. username .. ", it's getting late, get some sleep 😴"
    end
    return mesg
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    init = function()
        vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
            if event.data.actions.type == "move" then
            Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
            end
        end,
        })
    end,
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end,       desc = "Buffer delete",       mode = "n" },
        { "<leader>ba", function() Snacks.bufdelete.all() end,   desc = "Buffer delete all",   mode = "n" },
        { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Buffer delete other", mode = "n" },
        { "<leader>bz", function() Snacks.zen() end,             desc = "Toggle Zen Mode",     mode = "n" },
    },
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            preset = {
                pick = nil,
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = header,
            },
            sections = {
                { section = 'header' },
                {
                section = "keys",
                indent = 1,
                padding = 1,
                },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                -- {
                --     pane = 2,
                --     icon = " ",
                --     title = "Git Status",
                --     section = "terminal",
                --     enabled = function()
                --         return Snacks.git.get_root() ~= nil
                --     end,
                --     cmd = "git status --short --branch --renames",
                --     height = 5,
                --     padding = 1,
                --     ttl = 5 * 60,
                --     indent = 3,
                -- },
                -- { section = "greeting" },
                -- { section = "footer" },
                { align = "center", text = greeting(), padding = 1, },
                function()
                    local stats = require("lazy").stats()
                    local total_plugins = stats.count
                    local footer_datetime = os.date("  %m-%d-%Y   %H:%M:%S")
                    local version = vim.version()
                    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local value = footer_datetime .. "   Plugins " .. total_plugins .. nvim_version_info
                    return { align = "center", text = value, padding = 1, }
                end,
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true,  only_scope = true, },
        input = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scope = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        rename = { enabled = true },
        zen = {
        enabled = true,
        toggles = {
            ufo             = true,
            dim             = true,
            git_signs       = false,
            diagnostics     = false,
            line_number     = false,
            relative_number = false,
            signcolumn      = "no",
            indent          = false
        }
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        Snacks.toggle.new({
        id = "ufo",
        name = "Enable/Disable ufo",
        get = function()
            return require("ufo").inspect()
        end,
        set = function(state)
            if state == nil then
            require("noice").enable()
            require("ufo").enable()
            vim.o.foldenable = true
            vim.o.foldcolumn = "1"
            else
            require("noice").disable()
            require("ufo").disable()
            vim.o.foldenable = false
            vim.o.foldcolumn = "0"
            end
        end,
        })
    end
}